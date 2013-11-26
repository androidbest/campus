//
//  RegisterView.m
//  campus
//
//  Created by wangshuang on 11/15/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import "RegisterView.h"
#import "RegisterController.h"
@interface RegisterView ()

@end

@implementation RegisterView{

    RegisterController *registerController;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        registerController = [RegisterController new];
        registerController.registerView = self;
        self.controller = registerController;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title=@"注册";
    [registerController initView:0];
    [_segmentControl addTarget:self.controller action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
}

-(void)segmentAction:(UISegmentedControl *)Seg{}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
