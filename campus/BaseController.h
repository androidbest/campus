//
//  BaseController.h
//  campus
//
//  Created by wangshuang on 11/19/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ControllerProtocol.h"
#import "BaseView.h"
@interface BaseController : NSObject<ControllerProtocol>
-(void)initBackBarButtonItem:(BaseView *)baseView;
-(BOOL)judgeNetwork;
@end
