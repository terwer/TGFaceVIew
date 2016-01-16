//
//  TGFaceUtil.m
//  TGFaceVIew
//
//  Created by Terwer Green on 16/1/16.
//  Copyright © 2016年 Terwer Green. All rights reserved.
//

#import "TGFaceUtil.h"

#define kFaceBundlePath  [[NSBundle mainBundle] pathForResource:@"faces" ofType:@"bundle"]
#define kFacePlistName @"faces.plist"

@implementation DXFaceUtil

#pragma mark - private

/**
 *  根据图片名称获取对应的表情图片
 *
 *  @param imageName 图片名称，例如：001.png
 *
 *  @return UIImage
 */
+ (UIImage *)imageWithName:(NSString *)imageName {
    NSString *imagePath = [DXFaceUtil filePath:imageName];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    return image;
}

/**
 *  获取faces.bundle下面的文件对应的的文件路径
 *
 *  @param fileName 文件名
 *
 *  @return 文件完整路径
 */
+ (NSString *)filePath:(NSString *)fileName {
    NSString *path = [NSString stringWithFormat:@"%@/%@",kFaceBundlePath,fileName];
    return path;
}

#pragma mark - public

+ (UIImage *)imageWithFaceString:(NSString *)faceString{
    NSString *imageName = [DXFaceUtil imageNameWithFaceString:faceString];
    return [DXFaceUtil imageWithName:imageName];
}

+ (NSString*)faceStringWithImageName:(NSString*)imageName{
    NSString *facesPath = [DXFaceUtil filePath:kFacePlistName];
    NSDictionary *facesDict = [NSDictionary dictionaryWithContentsOfFile:facesPath];
    return facesDict[imageName];
}

+ (NSString *)imageNameWithFaceString:(NSString *)faceString{
    NSString *imageName = @"";
    NSString *facesPath = [DXFaceUtil filePath:kFacePlistName];
    NSDictionary *facesDict = [NSDictionary dictionaryWithContentsOfFile:facesPath];
    NSArray *keys = [facesDict allKeys];
    for (NSString *key in keys) {
        if ([facesDict[key] isEqualToString:faceString]) {
            imageName = key;
            break;
        }
    }
    return imageName;
}

@end
