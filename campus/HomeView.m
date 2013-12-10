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
#import "DDMenuController.h"
#import "SideslipView.h"
#import "AppDelegate.h"
@interface HomeView ()

@end

@implementation HomeView{
    MPMoviePlayerController *movie;
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
//    CGRect rect=CGRectMake(0, 0, ScreenWidth, NavigationBarHeight);
//    _navigationTitleView=[[NavigationTitleView alloc] initWithFrame:rect];
//    self.navigationItem.titleView=_navigationTitleView;
    
//    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    leftButton.frame = CGRectMake(0.0, 0.0, 35.0, 30.0);
//    [backButton setImage:[UIImage imageNamed:@"Btn_NaviBackGroud"] forState:UIControlStateNormal];
//    [backButton setImage:[UIImage imageNamed:@"Btn_NaviBackGroud"] forState:UIControlStateHighlighted];
//    [backButton addTarget:self.controller action:@selector(LeftDown) forControlEvents:UIControlEventTouchUpInside];
//    self.leftBtn=backButton;
//    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//    temporaryBarButtonItem.style = UIBarButtonItemStylePlain;
//    self.navigationItem.leftBarButtonItem=temporaryBarButtonItem;
//    if([self isKindOfClass:[LoginView class]]){
//        backButton.hidden=YES;
//    }

//     _left=[UIButton buttonWithType:UIButtonTypeCustom];
//     _left.frame=CGRectMake(5,10,28,28);
//     [_left setBackgroundImage:[UIImage imageNamed:@"home_topleft"] forState:UIControlStateNormal];
//     [self addSubview:_left];
    
    _leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.frame=CGRectMake(0,0,28,28);
    [_leftBtn setBackgroundImage:[UIImage imageNamed:@"home_topleft"] forState:UIControlStateNormal];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [_leftBtn addTarget:appDelegate.rootController action:@selector(showLeft:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:_leftBtn];
    
    
    
    _rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.frame=CGRectMake(0,0,28,28);
    [_rightBtn setBackgroundImage:[UIImage imageNamed:@"home_topright"] forState:UIControlStateNormal];
    [_rightBtn addTarget:self.controller action:@selector(loginPage) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:_rightBtn];
    self.navigationItem.title=@"青春向阳开";
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
    SGFocusImageFrame *bannerView = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 66, ScreenWidth, 70) delegate:self.controller imageItems:itempArray isAuto:YES num:3.0];
    bannerView.tag=0;
    [bannerView scrollToIndex:0];
    [self.view addSubview:bannerView];
    
    SGFocusImageFrame *bannerView1 = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 138, ScreenWidth, 169) delegate:self.controller imageItems:itempArray isAuto:YES num:4.0] ;
    
    bannerView1.tag=1;
    [bannerView1 scrollToIndex:0];
    [self.view addSubview:bannerView1];
    
    
    [_first addTarget:self.controller action:@selector(firstAction) forControlEvents:UIControlEventTouchUpInside];
    
    [_sencond addTarget:self.controller action:@selector(sencondAction:) forControlEvents:UIControlEventTouchUpInside];

    
}



-(void)firstAction{}

- (void)sencondAction:(UIButton *)button{}

-(void)viewWillAppear:(BOOL)animated{
   [self.navigationController.navigationBar setBarTintColor:nil];
   [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:20],NSFontAttributeName,nil]];
    self.navigationController.navigationBarHidden=NO;
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeAll;
    }
    [self swithGestureRecognizer:YES];
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

- (IBAction)sencond:(id)sender {
}
@end
