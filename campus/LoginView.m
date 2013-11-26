//
//  LoginView.m
//  campus
//
//  Created by wangshuang on 11/15/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import "LoginView.h"
#import "LoginController.h"
@interface LoginView ()

@end

@implementation LoginView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        LoginController *login=[LoginController new];
        login.loginView=self;
        self.controller=login;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_forgetpassword setTitleColor:[UIColor colorWithRed:0.01 green:0.39 blue:0.86 alpha:1.0] forState:UIControlStateNormal];
    [_loginBtn setBackgroundColor:[UIColor colorWithRed:0.01 green:0.39 blue:0.86 alpha:1.0]];
    _loginBtn.layer.masksToBounds = YES;
    _loginBtn.layer.cornerRadius = 6.0;
//    _loginBtn.layer.borderWidth = 1;
//    _loginBtn.layer.borderColor = [[UIColor colorWithRed:0.25 green:0.59 blue:1.0 alpha:1.0] CGColor];
//    self.navigationController.navigationBar.
//    [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];
    self.navigationItem.title=@"进入校园";
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0.0, 0.0, 28.0, 28.0);
    [rightBtn setImage:[UIImage imageNamed:@"home_topright"] forState:UIControlStateNormal];
    [rightBtn addTarget:self.controller action:@selector(registerBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    temporaryBarButtonItem.style = UIBarButtonItemStylePlain;
    self.navigationItem.rightBarButtonItem=temporaryBarButtonItem;
    [_msisdn becomeFirstResponder];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.01 green:0.39 blue:0.86 alpha:1.0]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:20],NSFontAttributeName,nil]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}

-(void)registerBtn{}

//点击背景取消键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_msisdn resignFirstResponder];
    [_password resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
