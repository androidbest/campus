//
//  HomeView.m
//  campus
//
//  Created by wangshuang on 11/15/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import "HomeView.h"
#import "HomeController.h"
#import "NavigationTitleView.h"
#import "SGFocusImageItem.h"
#import "SGFocusImageFrame.h"
#import "ToolUtils.h"
@interface HomeView ()

@end

@implementation HomeView{
    MPMoviePlayerController *movie;
    UIScrollView *scrollView;
    UIPageControl *pageControl;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        HomeController *home=[HomeController new];
        self.controller=home;
        home.homeView=self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *appConfig=[NSUserDefaults standardUserDefaults];
    if(![appConfig boolForKey:@"isLaunch"]){
        [self playMovie];
    }
    
    //top样式
    CGRect rect=CGRectMake(0, 0, ScreenWidth, NavigationBarHeight);
    NavigationTitleView *titleView=[[NavigationTitleView alloc] initWithFrame:rect];
    self.navigationItem.titleView=titleView;
    [titleView.right addTarget:self.controller action:@selector(loginPage) forControlEvents:UIControlEventTouchUpInside];
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    
    
    
    
    //广告宣传
    NSMutableArray *itempArray = [NSMutableArray array];
    SGFocusImageItem *item0 = [[SGFocusImageItem alloc] initWithTitle:@"-1" image:@"3" tag:-1];
    [itempArray addObject:item0];
    int length=3;
    for (int i = 0 ; i < length; i++)
    {
        SGFocusImageItem *item = [[SGFocusImageItem alloc] initWithTitle:[ToolUtils numToString:i] image:[NSString stringWithFormat:@"%d",i+1] tag:i];
        [itempArray addObject:item];
    }
    SGFocusImageItem *item3 = [[SGFocusImageItem alloc] initWithTitle:@"3" image:@"1" tag:3];
    [itempArray addObject:item3];
    SGFocusImageFrame *bannerView = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 66, ScreenWidth, 70) delegate:self.controller imageItems:itempArray isAuto:YES];
    [bannerView scrollToIndex:0];
    [self.view addSubview:bannerView];
    
    
    SGFocusImageFrame *bannerView1 = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 138, ScreenWidth, 169) delegate:self.controller imageItems:itempArray isAuto:YES];
    [bannerView1 scrollToIndex:0];
    [self.view addSubview:bannerView1];
  

}


-(void)viewWillAppear:(BOOL)animated{
   [self.navigationController.navigationBar setBarTintColor:nil];
}

-(void)loginPage{}

//视频播放
-(void)playMovie {
    //视频文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"welcome" ofType:@"mp4"];
    //视频URL
    NSURL *url = [NSURL fileURLWithPath:path];
    //视频播放对象
    movie = [[MPMoviePlayerController alloc] initWithContentURL:url];
    movie.controlStyle = MPMovieControlStyleNone;
    [movie.view setFrame:self.navigationController.view.bounds];
    [self.navigationController.view addSubview:movie.view];
    
    // 注册一个播放结束的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myMovieFinishedCallback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:movie];
    
    
//    [self performSelector:@selector(test) withObject:nil afterDelay:5];
    [movie play];
}

-(void)test{
    [movie play];
}

//视频播放结束
-(void)myMovieFinishedCallback:(NSNotification*)notify
{
    //视频播放对象
    MPMoviePlayerController* theMovie = [notify object];
    //销毁播放通知
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:theMovie];
    
    
    NSUserDefaults *appConfig=[NSUserDefaults standardUserDefaults];
    [appConfig setBool:YES forKey:@"isLaunch"];
    [appConfig synchronize];
    
    [UIView animateWithDuration:0.5 animations:
     ^{
       theMovie.view.alpha = 0;
     } completion:^(BOOL finished)
     {
         [theMovie.view removeFromSuperview];
     }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
