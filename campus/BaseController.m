//
//  BaseController.m
//  campus
//
//  Created by wangshuang on 11/19/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import "BaseController.h"
#import "ToolUtils.h"
@implementation BaseController
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}






//消除返回按钮后面的文字
-(void)initBackBarButtonItem:(BaseView *)baseView{
    baseView.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:baseView action:nil];
}

//判断网络
-(BOOL)judgeNetwork{
    BOOL ret=[ToolUtils isExistenceNetwork];
    if(!ret){
        [ToolUtils alertInfo:@"无网络,请检查网络设置"];
    }
    return ret;
}
@end
