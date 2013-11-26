//
//  SideslipView.m
//  campus
//
//  Created by wangshuang on 11/26/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import "SideslipView.h"
#import "SideslipController.h"
@interface SideslipView ()

@end

@implementation SideslipView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        SideslipController *sideslip=[SideslipController new];
        sideslip.sideslipView=self;
        self.controller=sideslip;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
