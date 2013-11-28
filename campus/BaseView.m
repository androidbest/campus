//
//  BaseView.m
//  campus
//
//  Created by wangshuang on 11/15/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import "BaseView.h"
#import "DDMenuController.h"
#import "AppDelegate.h"
@interface BaseView ()

@end

@implementation BaseView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//手势开关
-(void)swithGestureRecognizer:(BOOL) swith{
    AppDelegate *app=[[UIApplication sharedApplication] delegate];
    DDMenuController *menu=app.rootController;
    [menu.tap setEnabled:swith];
    [menu.pan setEnabled:swith];
}
@end
