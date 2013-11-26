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

@implementation RegisterView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        RegisterController *registerController = [RegisterController new];
        registerController.registerView=self;
        self.controller = registerController;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title=@"注册";
     [_segmentControl addTarget:self.controller action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)segmentAction:(UISegmentedControl *)Seg{}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
