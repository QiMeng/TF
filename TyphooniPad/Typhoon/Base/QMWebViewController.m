//
//  QMWebViewController.m
//  JinHuaIPAD
//
//  Created by strongsoft on 14-7-8.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import "QMWebViewController.h"

@interface QMWebViewController ()

@end

@implementation QMWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (!myWebView) {
        
        myWebView = [[UIWebView alloc]initWithFrame:self.view.bounds];
        myWebView.scalesPageToFit = YES;
        myWebView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        myWebView.delegate = self;
        
    }
    if([self.view.subviews indexOfObject:myWebView] == NSNotFound){
        [self.view addSubview:myWebView];
    }
    
}

- (void)loadWebView
{
    NSURL *url =[NSURL URLWithString:_urlString];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [myWebView loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showLoadingString:@"正在加载..."];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hiddenLoading];
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    [self showErrorString:@"网络连接错误"];
    
}
- (void)leftNavBar:(id)sender {
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]];
    [myWebView loadRequest:request];//清空数据
    myWebView.delegate = nil;
    
    [super leftNavBar:sender];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    myWebView.delegate = nil;
    
    QMRelease(myWebView);
    
#if ! __has_feature(objc_arc)
    [super dealloc];
#else
    
#endif
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
