//
//  ControllerProtocol.h
//  zwy
//
//  Created by sxit on 9/26/13.
//  Copyright (c) 2013 sxit. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ControllerProtocol <UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,UISearchBarDelegate,UIWebViewDelegate,UIActionSheetDelegate,UIAlertViewDelegate>
@optional
- (void)initWithData;
//初始化进度条
-(void)initData:(id)base;
@end