//
//  QMViewController.h
//  JinHuaIPAD
//
//  Created by strongsoft on 14-7-3.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <SVProgressHUD.h>

#import <ASIHTTPRequest.h>
#import <ASINetworkQueue.h>
#import <ASIFormDataRequest.h>
#import <JSONKit.h>

#define kASIUrl @"ASIUrl"
#define kASIName @"ASIName"
#define kASIData @"ASIData"


#import "QMNavigationController.h"


@interface QMViewController : UIViewController {
    
    UILabel *navTitle;
    ASIHTTPRequest *baseGet;
    ASIFormDataRequest *basePost;
    ASINetworkQueue *baseQuene;
    
    UIActivityIndicatorView * pActivity;
}

@property (nonatomic, strong) id model;
/**
 *  左边按钮
 */
- (void)leftDefaultNavBar;
- (void)leftNavBarImage:(NSString *)imageStr withText:(NSString *)text;
- (void)leftNavBar:(id)sender;

/**
 *  右边添加按钮
 */
- (void)rightDefaultNavBar;
- (void)rightNavBarImage:(NSString *)imageStr withText:(NSString *)text;
- (void)rightNavBar:(id)sender;

#pragma mark - loading 显示 ----------------------------------------
- (void)showLoading;
- (void)showLoadingString:(NSString *)string;
- (void)showSuccessString:(NSString *)string;
- (void)showErrorString:(NSString *)string;
- (void)hiddenLoading;


#pragma mark - ASIHTTPRequest ----------------------------------------
/**
 *  ASI Get网络请求 ; dic : 必须包含 kASIUrl, kASIName ,kASIData
 */
- (void)asiGetDic:(NSDictionary *)dic;
/**
 *  ASI Post网络请求 ; dic : 必须包含 kASIUrl, kASIName ,kASIData
 */
- (void)asiPostDic:(NSDictionary *)dic;
/**
 *  ASI Queues网络请求 ; array 由dic 组成,  dic : 必须包含 kASIUrl, kASIName ,kASIData
 */
- (void)asiNetworkQueuesPost:(NSArray *)array;


- (void)layerShadow:(UIView *)view;


@end
