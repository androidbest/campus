//
//  SideslipController.m
//  campus
//
//  Created by wangshuang on 11/26/13.
//  Copyright (c) 2013 campus. All rights reserved.
//

#import "SideslipController.h"

@implementation SideslipController{
    NSArray *data;
    NSArray *img;
}

-(id)init{
    self=[super init];
    if(self){
        data=@[@"我的糗事怪谈",@"我的致青春",@"我的帮帮忙",@"我的小铺",@"我的宿舍",@"密码修改",@"检查更新",@"关于"];
        img=@[[UIImage imageNamed:@"person_joke"],[UIImage imageNamed:@"person_campus_yung"],[UIImage imageNamed:@"person_favorite"],[UIImage imageNamed:@"person_shop"],[UIImage imageNamed:@"person_hostel"],[UIImage imageNamed:@"person_update_pwd"],[UIImage imageNamed:@"person_check_up"],[UIImage imageNamed:@"person_about"]];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * strcell = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:strcell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:strcell];
        cell.accessoryType =UITableViewCellAccessoryNone;
        cell.textLabel.font=[UIFont systemFontOfSize:16];
    }
    cell.textLabel.text= [data objectAtIndex:indexPath.row];
    cell.imageView.image=[img objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
