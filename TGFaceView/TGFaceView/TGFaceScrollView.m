//
//  TGFaceScrollView.m
//  TGFaceView
//
//  Created by Terwer Green on 16/1/16.
//  Copyright © 2016年 Terwer Green. All rights reserved.
//

#import "TGFaceScrollView.h"

@interface TGFaceScrollView ()<UIScrollViewDelegate,TGFaceViewDelegate>

@property (nonatomic, strong) UIScrollView *faceScrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) TGFaceView *faceView;

@end

@implementation TGFaceScrollView

#pragma maek - init
- (instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = kFaceViewBgColor;
        
        UIView* topBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.65f)];
        topBorder.backgroundColor = [UIColor colorWithWhite:0.8f alpha:1.0f];
        [self addSubview:topBorder];
        
        [self addSubview:self.faceScrollView];
        [self addSubview:self.pageControl];
        
        CGRect frame = self.frame;
        frame.size.height = CGRectGetMaxY(self.pageControl.frame) - CGRectGetMinY(topBorder.frame);
        self.frame = frame;
    }
    
    return self;
}

#pragma mark - getter
- (UIScrollView*)faceScrollView{
    if (!_faceScrollView) {
        _faceScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 1, SCREEN_WIDTH, self.faceView.frame.size.height)];
        _faceScrollView.contentSize = CGSizeMake(self.faceView.frame.size.width, self.faceView.frame.size.height);
        _faceScrollView.pagingEnabled = YES;
        _faceScrollView.showsHorizontalScrollIndicator = NO;
        _faceScrollView.clipsToBounds = NO;
        _faceScrollView.delegate = self;
        self.faceView.delegate = self;
        [_faceScrollView addSubview:self.faceView];
    }
    return _faceScrollView;
}

- (TGFaceView*)faceView{
    if (!_faceView) {
        _faceView = [[TGFaceView alloc] init];
        _faceView.frame = CGRectMake(0, 0, _faceView.pageCount * SCREEN_WIDTH, kMaxColCount * kFaceItemHeight);
    }
    return _faceView;
}

- (UIPageControl*)pageControl{
    if (!_pageControl) {
        CGFloat pageW = 40;
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - pageW)/2, self.faceScrollView.frame.size.height, pageW, 20)];
        _pageControl.backgroundColor = [UIColor clearColor];
        _pageControl.currentPage = 0;
        _pageControl.numberOfPages = self.faceView.pageCount;
        _pageControl.currentPageIndicatorTintColor = RGBACOLOR(138, 138, 138, 1.0);
        _pageControl.pageIndicatorTintColor = RGBACOLOR(187, 187, 187, 1.0);
    }
    return _pageControl;
}

#pragma mark - public
- (BOOL)stringIsFace:(NSString *)string{
    return NO;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int pageNumber = scrollView.contentOffset.x/SCREEN_WIDTH;
    _pageControl.currentPage = pageNumber;
}

#pragma mark - DXFaceViewDelegate

- (void)didSelectedFaceView:(NSString *)str isDelete:(BOOL)isDelete{
    if (_delegate) {
        [_delegate didSelectedFaceView:str isDelete:isDelete];
    }
}

@end
