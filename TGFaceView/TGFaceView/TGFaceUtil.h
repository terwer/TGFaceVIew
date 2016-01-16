//
//  TGFaceUtil.h
//  TGFaceView
//
//  Created by Terwer Green on 16/1/16.
//  Copyright © 2016年 Terwer Green. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DXFaceUtil : NSObject

/**
 *  根据图片名称返回对应的表情图片
 *
 *  @param imageName 图片名称,例如：001.png
 *
 *  @return UIImage
 */
+ (UIImage *)imageWithName:(NSString *)imageName;
/**
 *  根据图片名称获取图片对应的字符串
 *
 *  @param imageName 图片名称,例如：001.png
 *
 *  @return 表情对应的字符串，例如：[微笑]
 */
+ (NSString*)faceStringWithImageName:(NSString*)imageName;
/**
 *  根据表情字符获取图片名称（例如：根据"[微笑]"获取对应的表情图片）
 *
 *  @param faceString 表情字符串，例如：[微笑]
 *
 *  @return UIImage
 */
+ (UIImage *)imageWithFaceString:(NSString *)faceString;

@end
