//
//  TGFaceView.m
//  TGFaceView
//
//  Created by Terwer Green on 16/1/16.
//  Copyright © 2016年 Terwer Green. All rights reserved.
//

#import "TGFaceView.h"
#import "Emoji.h"
#import "TGFaceUtil.h"

@interface TGFaceView (){
    NSArray* _faces;
}

@property (nonatomic, copy) NSString *selectedFaceName;
@property (nonatomic, assign) NSInteger realPageFacesCount;//这个记录一页共有几个，因为要预留一个位置做删除

@end

@implementation TGFaceView

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kFaceViewBgColor;
        
        [self initView];
    }
    return self;
}


- (void)initView{
    NSInteger row = 0;
    NSInteger column = 0;
    NSInteger pageNum = 0;
    
    for (int i = 0; i< self.faces.count; i++) {
        NSInteger currentPageFacesCount = (i % self.realPageFacesCount);
        row = currentPageFacesCount / kRowFacesCount;
        column = (currentPageFacesCount % kRowFacesCount) ;
        pageNum = i / self.realPageFacesCount;
        
        [self addFace:self.faces[i]
              adIndex:i
        atPositionRow:row
      atPositionColum:column
               atPage:pageNum];
        
        //添加删除按钮(如果需要添加更多按钮，需要修改self.realPageFacesCount，减去对应的数目)
        //删除
        NSInteger maxRow = kMaxColCount;
        NSInteger maxCol = kRowFacesCount;
        //最后一页可能不完整
        if ((row == maxRow - 1 && column == maxCol - 2) || i == self.faces.count-1) {
            UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
            CGRect delFrame = CGRectMake((maxCol - 1) * kFaceItemWidth + 15, (maxRow - 1) * kFaceItemHeight + 15, 25, 25);
            //修正最后一个删除的位置
            if (i == self.faces.count-1) {
                delFrame = CGRectMake((column + 1) * kFaceItemWidth + 15, ( row) * kFaceItemHeight + 15, 25, 25);
            }
            float x = delFrame.origin.x + (pageNum * SCREEN_WIDTH);
            //修正边距
            x -= 15/2.0f;
            delFrame.origin.x = x;
            deleteButton.frame = delFrame;
            //NSLog(@"deleteButton frame:%@",NSStringFromCGRect(deleteButton.frame));
            //[deleteButton setBackgroundColor:[UIColor redColor]];
            [deleteButton setImage:[UIImage imageNamed:@"faceDelete"] forState:UIControlStateNormal];
            deleteButton.tag = 10000;
            [deleteButton addTarget:self action:@selector(selectedFaceAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:deleteButton];
        }
        
        /*
         //发送
         UIButton *sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
         [sendButton setTitle:NSLocalizedString(@"send", @"Send") forState:UIControlStateNormal];
         CGRect sendFrame = CGRectMake((maxCol - 1) * kFaceItemWidth + 15, (maxRow - 1) * kFaceItemHeight + 15, 30, 30);
         sendButton.frame = sendFrame;
         [sendButton addTarget:self action:@selector(sendAction:) forControlEvents:UIControlEventTouchUpInside];
         [sendButton setBackgroundColor:[UIColor colorWithRed:10 / 255.0 green:82 / 255.0 blue:104 / 255.0 alpha:1.0]];
         [self addSubview:sendButton];
         */
    }
}


#pragma mark - private

- (void)addFace:(NSString *)imageName
        adIndex:(NSInteger)index
  atPositionRow:(NSInteger)aRow
atPositionColum:(NSInteger)aColum
         atPage:(NSInteger)pageNum
{
    CGRect imageFrame = CGRectMake(aColum * kFaceItemWidth + 15, aRow * kFaceItemHeight + 15, 25, 25);
    float x = imageFrame.origin.x + (pageNum * SCREEN_WIDTH);
    //修正边距
    x -= 15/2.0f;
    imageFrame.origin.x = x;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor clearColor]];
    button.frame = imageFrame;
    if ([imageName rangeOfString:@"png"].location!=NSNotFound  ) {
        //NSLog(@"自有图片表情");
        UIImage *image = [DXFaceUtil imageWithName:imageName];
        [button setBackgroundImage:image forState:UIControlStateNormal];
    }else{//Emoji
        [button.titleLabel setFont:[UIFont fontWithName:@"AppleColorEmoji" size:24.0]];
        [button setTitle: imageName forState:UIControlStateNormal];
    }
    button.tag = index;
    [button addTarget:self action:@selector(selectedFaceAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}


#pragma mark - getter

- (NSArray*)faces{
    if (!_faces) {
        _faces  = [Emoji allEmoji];
    }
    return _faces;
}

-(NSInteger)realPageFacesCount{
    return kPageFacesCount-1;
}

- (NSInteger)pageCount{
    return self.faces.count / self.realPageFacesCount + 1;
}


#pragma mark - action

- (void)selectedFaceAction:(UIButton *)sender{
    BOOL isDelete = NO;
    NSString *faceString = @"";
    if (sender.tag == 10000) {
        isDelete = YES;
    }else{
        NSString *imageName = self.faces[sender.tag];
        faceString = imageName;
        if ([imageName rangeOfString:@"png"].location!=NSNotFound  ) {
            faceString = [DXFaceUtil faceStringWithImageName:imageName];
        }
        NSLog(@"点击表情%ld %@ %@",sender.tag,self.faces[sender.tag],faceString);
    }
    if (_delegate) {
        [_delegate didSelectedFaceView:faceString isDelete:isDelete];
    }
}

@end
