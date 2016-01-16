//
//  TGFaceScrollView.h
//  TGFaceView
//
//  Created by Terwer Green on 16/1/16.
//  Copyright © 2016年 Terwer Green. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TGFaceView.h"

@interface TGFaceScrollView : UIView

@property (nonatomic, weak) id<TGFaceViewDelegate> delegate;

- (BOOL)stringIsFace:(NSString *)string;

@end
