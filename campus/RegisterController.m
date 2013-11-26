//
//  RegisterController.m
//  campus
//
//  Created by shijin on 13-11-26.
//  Copyright (c) 2013年 campus. All rights reserved.
//

#import "RegisterController.h"
#import "MailRegView.h"
#import "MobileRegView.h"
@implementation RegisterController{

    
    
}


//页签选择
-(void)segmentAction:(UISegmentedControl *)Seg{
    NSInteger Index = Seg.selectedSegmentIndex;
    switch (Index) {
        case 0:{
            //手机注册
            [self initView:&Index];
            NSLog(@"test %ld",(long)Index);
        }
            break;
        case 1:{
            //邮箱注册
            [self initView:&Index];
            NSLog(@"test %ld",(long)Index);
        }
            break;
    }
    
    
}

//初始化注册视图
-(void) initView:(NSInteger *)index{
    if (index==0) {
        MobileRegView *mobileRegView=[[MobileRegView alloc] initWithNibName:@"MobileRegView" bundle:nil];
        mobileRegView.view.frame=CGRectMake(0, 100, 320,480 );
        [self.registerView addChildViewController:mobileRegView];
        [self.registerView.view addSubview:mobileRegView.view];
    }else{
        MailRegView *mailRegView=[[MailRegView alloc] initWithNibName:@"MailRegView" bundle:nil];
        mailRegView.view.frame=CGRectMake(0, 100, 320,480 );
        [self.registerView addChildViewController:mailRegView];
        [self.registerView.view addSubview:mailRegView.view];
    }
}

@end
