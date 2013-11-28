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
#import "MapView.h"
@implementation HomeController

//跳转登录
-(void)loginPage{
    LoginView *login=[LoginView new];
    [self initBackBarButtonItem:self.homeView];
    [self.homeView.navigationController pushViewController:login animated:YES];
}

//怪咖汇
-(void)firstAction{
    MapView *map=[MapView new];
    [self.homeView.navigationController pushViewController:map animated:YES];
}

- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(SGFocusImageItem *)item
{
//    NSLog(@"%s \n click===>%@",__FUNCTION__,item.title);
}
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame currentItem:(NSInteger)index;
{
//    NSLog(@"%s \n scrollToIndex===>%ld",__FUNCTION__,index);
}


- (void)sencondAction:(UIButton *) button{

    [self zoomAnimation:button];

}

- (void) zoomAnimation:(UIButton *) button{
    
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationDelegate:self];
    
    button.transform = CGAffineTransformScale([self transformForOrientation],0.9, 0.9);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationDelegate:self];
    button.transform = CGAffineTransformScale([self transformForOrientation],1,1);
    [UIView commitAnimations];
}

- (CGAffineTransform)transformForOrientation {
	UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
	if (UIInterfaceOrientationLandscapeLeft == orientation) {
		return CGAffineTransformMakeRotation(M_PI*1.5);
	} else if (UIInterfaceOrientationLandscapeRight == orientation) {
		return CGAffineTransformMakeRotation(M_PI/2);
	} else if (UIInterfaceOrientationPortraitUpsideDown == orientation) {
		return CGAffineTransformMakeRotation(-M_PI);
	} else {
		return CGAffineTransformIdentity;
	}
}


@end
