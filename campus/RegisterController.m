//
//  RegisterController.m
//  campus
//
//  Created by shijin on 13-11-26.
//  Copyright (c) 2013年 campus. All rights reserved.
//

#import "RegisterController.h"

@implementation RegisterController{

    NSInteger selector;
    
}


//页签选择
-(void)segmentAction:(UISegmentedControl *)Seg{
    NSInteger Index = Seg.selectedSegmentIndex;
    switch (Index) {
        case 0:{
            //新闻资讯
            selector=0;
        }
            break;
        case 1:{
            //经典笑话
            selector=1;
        }
            break;
    }
    
    
}

@end
