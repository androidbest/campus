//
//  HomeController.m
//  campus
//
//  Created by wangshuang on 11/19/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import "HomeController.h"
#import "LoginView.h"
#import "SGFocusImageFrame.h"
#import "SGFocusImageItem.h"
@implementation HomeController

//跳转登录
-(void)loginPage{
    LoginView *login=[LoginView new];
    [self initBackBarButtonItem:self.homeView];
    [self.homeView.navigationController pushViewController:login animated:YES];
}

- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(SGFocusImageItem *)item
{
    NSLog(@"%s \n click===>%@",__FUNCTION__,item.title);
}
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame currentItem:(NSInteger)index;
{
    NSLog(@"%s \n scrollToIndex===>%ld",__FUNCTION__,index);
}

@end
