//
//  MapView.m
//  campus
//
//  Created by wangshuang on 11/15/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import "MapView.h"
#import "MapController.h"
#import "ConfigFile.h"
#import "Constants.h"
#import "DDMenuController.h"
#import "AppDelegate.h"
@interface MapView ()

@end

@implementation MapView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        MapController *map=[MapController new];
        map.mapView=self;
        self.controller=map;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //全屏
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    _webView.scalesPageToFit =YES;//自动对页面进行缩放以适应屏幕
    _webView.delegate=self.controller;
    _webView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.activityIndicatorView =[[UIActivityIndicatorView alloc]
                             initWithFrame : CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)] ;
    [self.activityIndicatorView setCenter: _webView.center] ;
    [self.activityIndicatorView setActivityIndicatorViewStyle: UIActivityIndicatorViewStyleGray];
    //_webview.scrollView.bounces = NO; 禁用下拉
    [self.activityIndicatorView startAnimating];
    [self.view addSubview :self.activityIndicatorView];
    [self loadWebPageWithString:[NSString stringWithFormat:@"%@%@",[ConfigFile newInstance].configData[@"httpurl"],helpurl]];
    
    // 右滑的 Recognizer
    SEL leftSelector = NSSelectorFromString(@"rightSwipe:");
    UISwipeGestureRecognizer *leftSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self.controller action:leftSelector];
    //设置滑动方向
    [leftSwipeRecognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
    leftSwipeRecognizer.delegate=self.controller;
    [_webView addGestureRecognizer:leftSwipeRecognizer];
    
    
    // 左滑的 Recognizer
    SEL rightSelector = NSSelectorFromString(@"leftSwipe:");
    UISwipeGestureRecognizer *rightSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self.controller action:rightSelector];
    //设置滑动方向
    [rightSwipeRecognizer setDirection:UISwipeGestureRecognizerDirectionRight];
    rightSwipeRecognizer.delegate=self.controller;
    [_webView addGestureRecognizer:rightSwipeRecognizer];
    
}

- (void)loadWebPageWithString:(NSString*)urlString{
    NSURL *url =[NSURL URLWithString:urlString];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=YES;
    [self swithGestureRecognizer:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
