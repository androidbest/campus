//
//  AppDelegate.h
//  campus
//
//  Created by wangshuang on 11/13/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDMenuController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) DDMenuController *rootController;
@end
