//
//  BaseView.h
//  campus
//
//  Created by wangshuang on 11/15/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControllerProtocol.h"
@interface BaseView : UIViewController
@property(strong,nonatomic)id<ControllerProtocol> controller;
@end
