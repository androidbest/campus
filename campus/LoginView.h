//
//  LoginView.h
//  campus
//
//  Created by wangshuang on 11/15/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import "BaseView.h"

@interface LoginView : BaseView
@property (strong, nonatomic) IBOutlet UITextField *msisdn;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *forgetpassword;
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;

@end
