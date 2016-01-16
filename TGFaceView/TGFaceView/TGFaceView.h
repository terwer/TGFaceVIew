//
//  TGFaceView.h
//  TGFaceView
//
//  Created by Terwer Green on 16/1/16.
//  Copyright © 2016年 Terwer Green. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFaceViewBgColor RGBACOLOR(246,246,248,1.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)

#define kFaceItemWidth 40.0
#define kFaceItemHeight 40.0
#define kMaxColCount 3
#define kRowFacesCount ((int)(SCREEN_WIDTH / kFaceItemWidth))
#define kPageFacesCount (kRowFacesCount * kMaxColCount)

@protocol DXFaceViewDelegate <NSObject>

@required
- (void)didSelectedFaceView:(NSString*)str isDelete:(BOOL)isDelete;

@end

@interface TGFaceView : UIView

@property(nonatomic) id<DXFaceViewDelegate> delegate;
//所有的表情集合
@property (nonatomic, strong, readonly) NSArray *faces;
//一共有多少页
@property (nonatomic, assign, readonly) NSInteger pageCount;

@end
