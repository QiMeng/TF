//
//  QMWebViewController.h
//  JinHuaIPAD
//
//  Created by strongsoft on 14-7-8.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import "QMViewController.h"

@interface QMWebViewController : QMViewController <UIWebViewDelegate> {
    
    UIWebView * myWebView;
    
}

@property (nonatomic, copy) NSString *urlString;

- (void)loadWebView;

@end
