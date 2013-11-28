//
//  MobileRegView.m
//  campus
//
//  Created by shijin on 13-11-26.
//  Copyright (c) 2013年 campus. All rights reserved.
//

#import "MobileRegView.h"

@interface MobileRegView ()

@end

@implementation MobileRegView

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
    self.registerButton.layer.masksToBounds = YES;
    self.registerButton.layer.cornerRadius = 6.0;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
