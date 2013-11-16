//
//  OpeningAnimation.m
//  campus
//
//  Created by shijin on 13-11-16.
//  Copyright (c) 2013年 campus. All rights reserved.
//

#import "OpeningAnimation.h"

@implementation OpeningAnimation
@synthesize mPMoviePlayerController=movie;//必须是全局变量

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self playMovie];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)playMovie {
    //视频文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"welcome" ofType:@"mp4"];
    //视频URL
    NSURL *url = [NSURL fileURLWithPath:path];
    //视频播放对象
     movie = [[MPMoviePlayerController alloc] initWithContentURL:url];
    movie.controlStyle = MPMovieControlStyleNone;
    [movie.view setFrame:self.view.bounds];
    movie.initialPlaybackTime = -1;
   [self.view addSubview:movie.view];

    // 注册一个播放结束的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myMovieFinishedCallback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:movie];
   
    [movie play];
}

#pragma mark -------------------视频播放结束委托--------------------

/*
 @method 当视频播放完毕释放对象
 */
-(void)myMovieFinishedCallback:(NSNotification*)notify
{
    //视频播放对象
    MPMoviePlayerController* theMovie = [notify object];
    //销毁播放通知
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:theMovie];
    [theMovie.view removeFromSuperview];
    // 释放视频对象
   // [theMovie release];
}

@end
