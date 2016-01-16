//
//  TGFaceView.h
//  TGFaceVIew
//
//  Created by Terwer Green on 16/1/16.
//  Copyright © 2016年 Terwer Green. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFaceViewBgColor RGBACOLOR(246,246,248,1.0)

#define kFaceItemWidth 40.0
#define kFaceItemHeight 40.0
#define kMaxColCount 3
#define kRowFacesCount ((int)(SCREEN_WIDTH / kFaceItemWidth))
#define kPageFacesCount (kRowFacesCount * kMaxColCount)

@interface TGFaceView : UIView

@end
