//
//  SideslipView.m
//  campus
//
//  Created by wangshuang on 11/29/13.
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
        SideslipController *sides=[SideslipController new];
        sides.sideslipView=self;
        self.controller=sides;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _tableview.delegate=self.controller;
    _tableview.dataSource=self.controller;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
