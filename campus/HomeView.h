//
//  HomeView.h
//  campus
//
//  Created by wangshuang on 11/15/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import "BaseView.h"
#import <MediaPlayer/MediaPlayer.h>
#import "NavigationTitleView.h"
@interface HomeView : BaseView
@property (strong ,nonatomic)NavigationTitleView * navigationTitleView;
@property (strong, nonatomic)UIButton *leftBtn;
@property (strong, nonatomic)UIButton *rightBtn;
@end
