//
//  MapController.m
//  campus
//
//  Created by wangshuang on 11/27/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import "MapController.h"
#import "ToolUtils.h"
#import "Constants.h"
#import "GuanTanView.h"
#import "ChouShiView.h"
@implementation MapController

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.mapView.activityIndicatorView startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.mapView.activityIndicatorView stopAnimating];
}

- (BOOL)webView: (UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *requestString = [[request URL] absoluteString];
    NSArray *components = [requestString componentsSeparatedByString:@"::"];
    if (components != nil && [components count] > 0) {
        NSString *pocotol = components[0];
        if ([pocotol isEqualToString:@"app"]) {
            NSString *commandStr = components[1];
            NSArray *commandArray = [commandStr componentsSeparatedByString:@":"];
            if (commandArray != nil && [commandArray count] > 0) {
                NSString *command = commandArray[0];
                if ([command isEqualToString:@"map"]) {
                    NSArray *dataArray = [commandArray[1] componentsSeparatedByString:@","];
                    NSLog(@"%@",dataArray);
//                    MapBuildView *build=[[MapBuildView alloc] init:dataArray];
//                    [_mapView.navigationController pushViewController:build animated:YES];
                }
            }
            return NO;
        }
    }    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [ToolUtils alertInfo:requestError];
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

//右滑
-(void)rightSwipe:(UISwipeGestureRecognizer*)recognizer
{
    //处理滑动操作
    NSLog(@"滑动，快速移动");
    UITabBarController *tab=[UITabBarController new];
    GuanTanView *guantanView=[GuanTanView new];
    ChouShiView *choushiView=[ChouShiView new];
    tab.viewControllers=@[guantanView,choushiView];
    [_mapView.navigationController pushViewController:tab animated:YES];
//    CGPoint translation = [recognizer locationInView:self.view];
//    NSLog(@"Swipe - start location: %f,%f", translation.x, translation.y);
    //    recognizer.view.transform = CGAffineTransformMakeTranslation(translation.x, translation.y);
}

//左滑
-(void)leftSwipe:(UISwipeGestureRecognizer*)recognizer
{
    //处理滑动操作
    [_mapView.navigationController popViewControllerAnimated:YES];
}

@end
