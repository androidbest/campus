//
//  HomeController.m
//  campus
//
//  Created by wangshuang on 11/19/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import "HomeController.h"
#import "LoginView.h"
@implementation HomeController

//跳转登录
-(void)loginPage{
    LoginView *login=[LoginView new];
    [self initBackBarButtonItem:self.homeView];
    [self.homeView.navigationController pushViewController:login animated:YES];
}

@end
