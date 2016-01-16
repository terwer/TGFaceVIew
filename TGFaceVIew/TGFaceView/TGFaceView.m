//
//  TGFaceView.m
//  TGFaceVIew
//
//  Created by Terwer Green on 16/1/16.
//  Copyright © 2016年 Terwer Green. All rights reserved.
//

#import "TGFaceView.h"
#import "Emoji.h"

@interface TGFaceView (){
    NSArray* _faces;
}

@property (nonatomic, assign) NSInteger realPageFacesCount;//这个记录一页共有几个，因为要预留一个位置做删除

@end

@implementation TGFaceView

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


@end
