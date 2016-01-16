//
//  ViewController.m
//  TGFaceView
//
//  Created by Terwer Green on 16/1/16.
//  Copyright © 2016年 Terwer Green. All rights reserved.
//

#import "ViewController.h"
#import "TGFaceView/TGFaceScrollView.h"

#define kMinHeight 36
#define kMaxHeight 200
#define kHorizontalPadding 8
#define kVerticalPadding 5

@interface ViewController ()

@property (strong, nonatomic) TGFaceScrollView *faceScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initView];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

#pragma mark - init

- (void)initView{
    UIButton *showButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width - 40, 30)];
    [showButton setTitle:@"显示表情" forState:UIControlStateNormal];
    [showButton setBackgroundColor:[UIColor grayColor]];
    [showButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:showButton];
    
    
    [self.view addSubview:self.faceScrollView];
}

#pragma mark - getter

- (TGFaceScrollView*)faceScrollView{
    if (!_faceScrollView) {
        CGFloat faceHeight = 200;
        _faceScrollView = [[TGFaceScrollView alloc] initWithFrame:CGRectMake( 0,self.view.frame.size.height - faceHeight - kVerticalPadding * 2 , self.view.frame.size.width, faceHeight)];
        //高度修正
        _faceScrollView.delegate = self;
        _faceScrollView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    }
    return _faceScrollView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
