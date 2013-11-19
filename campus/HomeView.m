//
//  HomeView.m
//  campus
//
//  Created by wangshuang on 11/15/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import "HomeView.h"
#import "HomeController.h"
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
    
//    self.navigationController.navigationBar.topItem
    
    
}

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
    
    
//    NSUserDefaults *appConfig=[NSUserDefaults standardUserDefaults];
//    [appConfig setBool:YES forKey:@"isLaunch"];
//    [appConfig synchronize];
    
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
