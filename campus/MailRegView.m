//
//  MailRegView.m
//  campus
//
//  Created by shijin on 13-11-26.
//  Copyright (c) 2013年 campus. All rights reserved.
//

#import "MailRegView.h"

@interface MailRegView ()

@end

@implementation MailRegView

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
    // Do any additional setup after loading the view from its nib.
    self.registerButton.layer.masksToBounds = YES;
    self.registerButton.layer.cornerRadius = 6.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
