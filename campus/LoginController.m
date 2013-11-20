//
//  LoginController.m
//  campus
//
//  Created by wangshuang on 11/21/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import "LoginController.h"
#import "RegisterView.h"
@implementation LoginController

//注册按钮
-(void)registerBtn{
    RegisterView *registerView=[RegisterView new];
    [self initBackBarButtonItem:self.loginView];
    [self.loginView.navigationController pushViewController:registerView animated:YES];
}
@end
