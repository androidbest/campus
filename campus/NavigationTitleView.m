//
//  NavigationTitleView.m
//  campus
//
//  Created by wangshuang on 11/20/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import "NavigationTitleView.h"

@implementation NavigationTitleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
//        self.layer.borderColor = [UIColor blackColor].CGColor;
//        self.layer.borderWidth = 1.0;
        
        _title =[[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2-75,10,150,25)];
        _title.text=@"青春向阳开";
        _title.textAlignment=NSTextAlignmentCenter;
        _title.font=[UIFont boldSystemFontOfSize:20];
//        _title.textColor=[UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.0];
        _title.backgroundColor=[UIColor clearColor];
//        _title.layer.borderColor = [UIColor blackColor].CGColor;
//        _title.layer.borderWidth = 1.0;
        [self addSubview:_title];
        
        _left=[UIButton buttonWithType:UIButtonTypeCustom];
        _left.frame=CGRectMake(0,10,28,28);
        [_left setBackgroundImage:[UIImage imageNamed:@"home_topleft"] forState:UIControlStateNormal];
        [self addSubview:_left];
        
        _right=[UIButton buttonWithType:UIButtonTypeCustom];
        _right.frame=CGRectMake(ScreenWidth-50,10,28,28);
        [_right setBackgroundImage:[UIImage imageNamed:@"home_topright"] forState:UIControlStateNormal];
        [self addSubview:_right];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
}

@end
