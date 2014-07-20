//
//  QMViewController.m
//  JinHuaIPAD
//
//  Created by strongsoft on 14-7-3.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import "QMViewController.h"

#import "QMCategory.h"

@interface QMViewController ()

@end

@implementation QMViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    [super loadView];
    [self navTitle];
    
    self.navigationController.navigationBar.translucent = NO;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBA(230, 230, 230, 1);//[UIColor whiteColor];
    self.navigationController.view.backgroundColor = RGBA(230, 230, 230, 1);//[UIColor whiteColor];
}

#pragma mark - navBar ----------------------------------------------
- (void)navTitle {
    
    if (!navTitle) {

        navTitle = [UILabel allocLabelFrame:CGRectMake(0, 0, 200, self.navigationController.navigationBar.height)
                                       text:self.title
                                       font:[UIFont boldSystemFontOfSize:20]
                                  textColor:[UIColor blackColor]
                                    bgColor:[UIColor clearColor]
                             textAlignament:NSTextAlignmentCenter
                           autoresizingMask:UIViewAutoresizingNone];

    }
    
    self.navigationItem.titleView = navTitle;

}
- (void)leftDefaultNavBar{
    [self leftNavBarImage:@"icon_back" withText:@""];
}
- (void)leftNavBarImage:(NSString *)imageStr withText:(NSString *)text{
    
    UIImage *img = [UIImage imageNamed:imageStr];
    UIButton *button = nil;
    CGSize size = CGSizeMake(0, 0);
    if (text.length ) {
        size = [text sizeFromString:text andFontSize:15];
    }
    
    button = [UIButton allocButtonFrame:CGRectMake(0, 0, img.width + size.width + 5, self.navigationController.navigationBar.height)
                            normalTitle:text
                          selectedTitle:nil
                       normalTitleColor:[UIColor blackColor]
                     selectedTitleColor:nil
                        backgroundColor:nil
                              titleFont:[UIFont boldSystemFontOfSize:15]
                            normalImage:img
                          selectedImage:nil
                          normalBgImage:nil
                        selectedBgImage:nil
                                 target:self
                               selector:@selector(leftNavBar:)
                       autoresizingMask:UIViewAutoresizingNone];
    
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.leftBarButtonItem = barBtn;
    
    SAFE_RELEASE(barBtn);
    
    
}
- (void)leftNavBar:(id)sender{
    [self asiClearn];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)rightDefaultNavBar{
    [self leftNavBarImage:@"icon_back" withText:@""];
}
- (void)rightNavBarImage:(NSString *)imageStr withText:(NSString *)text{
    
    UIImage *img = [UIImage imageNamed:imageStr];
    UIButton *button = nil;
    CGSize size = CGSizeMake(0, 0);
    if (text.length ) {
        size = [text sizeFromString:text andFontSize:15];
    }
    
    button = [UIButton allocButtonFrame:CGRectMake(0, 0, img.width + size.width + 5, self.navigationController.navigationBar.height)
                            normalTitle:text
                          selectedTitle:nil
                       normalTitleColor:[UIColor blackColor]
                     selectedTitleColor:nil
                        backgroundColor:nil
                              titleFont:[UIFont boldSystemFontOfSize:15]
                            normalImage:img
                          selectedImage:nil
                          normalBgImage:nil
                        selectedBgImage:nil
                                 target:self
                               selector:@selector(rightNavBar:)
                       autoresizingMask:UIViewAutoresizingNone];
    
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = barBtn;
    
    SAFE_RELEASE(barBtn);
    
    
}
- (void)rightNavBar:(id)sender{
    
    
}


#pragma mark - loading 显示 ----------------------------------------
- (void)showLoading {
    
    [self showLoadingString:@""];
}
- (void)showLoadingString:(NSString *)string {
    
    if (!pActivity) {
        pActivity = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        pActivity.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin;
        pActivity.backgroundColor = [UIColor lightGrayColor];
        [pActivity borderAndRadiusColor:[UIColor lightGrayColor]];
        pActivity.center = self.view.center;
        pActivity.color = [UIColor blackColor];
        
        QMAutorelease(pActivity);
    }
    
    if([self.view.subviews indexOfObject:pActivity] == NSNotFound)
        [self.view addSubview:pActivity];
    
    pActivity.hidden = NO;
    [pActivity startAnimating];
}
- (void)showSuccessString:(NSString *)string{
    pActivity.hidden = YES;;
    [pActivity stopAnimating];

}
- (void)showErrorString:(NSString *)string {
    pActivity.hidden = YES;;
    [pActivity stopAnimating];
}
- (void)hiddenLoading {
    pActivity.hidden = YES;;
    [pActivity stopAnimating];
}

#pragma mark - ASIHTTPRequest ----------------------------------------
//  GET
- (void)asiGetDic:(NSDictionary *)dic {
    [self asiDealloc:baseGet];
    
    NSString *asiurl = [dic objectForKey:kASIUrl];
    DLog(@"%@",asiurl);
    
    asiurl = [asiurl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    asiurl = [asiurl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    DLog( @"转:%@",asiurl);
    
    baseGet = [[ASIHTTPRequest alloc]initWithURL:[NSURL URLWithString:asiurl]];
    baseGet.delegate = self;
    baseGet.timeOutSeconds = 30;
    baseGet.userInfo = @{kASIName: [dic objectForKey:kASIName]};
    [baseGet setDidFinishSelector:@selector(asiGetFinished:)];
    [baseGet setDidFailSelector:@selector(asiGetFailed:)];
    [baseGet startAsynchronous];
    
}
- (void)asiGetFinished:(ASIHTTPRequest *)rq {
    NSString *requestString = [rq responseString];
    id data = [requestString objectFromJSONString];
    DLog(@"%@",data);

}
- (void)asiGetFailed:(ASIHTTPRequest *)rq {
    NSString *requestString = [rq responseString];
    id data = [requestString objectFromJSONString];
    DLog(@"%@",data);

}
//  POST
- (void)asiPostDic:(NSDictionary *)dic {
    [self asiDealloc:basePost];
    
    NSString *asiurl = [dic objectForKey:kASIUrl];
    DLog(@"%@",asiurl);

    asiurl = [asiurl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    basePost = [[ASIFormDataRequest alloc]initWithURL:[NSURL URLWithString:asiurl]];
    basePost.delegate = self;
    basePost.timeOutSeconds = 60;
    [basePost setRequestMethod:@"POST"];
    basePost.userInfo = @{kASIName: [dic objectForKey:kASIName]};
    
    NSDictionary *dataDic = [dic objectForKey:kASIData];
    for (NSString *key in dataDic) {
        
        id obj = [dataDic objectForKey:key];
        
        if ([obj isKindOfClass:[NSString class]]) {
            [basePost setPostValue:obj forKey:key];
        }
        else if ([obj isKindOfClass:[NSNumber class]]) {
            [basePost setPostValue:obj forKey:key];
        }
        
        
    }
    
    [basePost setDidFinishSelector:@selector(asiPostFinished:)];
    [basePost setDidFailSelector:@selector(asiPostFailed:)];
    [basePost startAsynchronous];
    
}
- (void)asiPostFinished:(ASIFormDataRequest *)rq {
    NSString *requestString = [rq responseString];
    id data = [requestString objectFromJSONString];
    DLog(@"%@",data);
    
}
- (void)asiPostFailed:(ASIFormDataRequest *)rq {
    NSString *requestString = [rq responseString];
    id data = [requestString objectFromJSONString];
    DLog(@"%@",data);
    
}
//  NetworkQueues- post
- (void)asiNetworkQueuesPost:(NSArray *)array {
    [self asiDealloc:baseQuene];
    
    baseQuene = [[ASINetworkQueue alloc] init];
    baseQuene.delegate = self;
    NSString *urlString = nil;
    for (NSDictionary *tempDic in array) {
        
        urlString = [[tempDic objectForKey:kASIUrl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        DLog(@"%@",urlString);
        ASIFormDataRequest *postRq = [[ASIFormDataRequest alloc]initWithURL:[NSURL URLWithString:urlString]];
        postRq.delegate = self;
        postRq.timeOutSeconds = 60;
        [postRq setRequestMethod:@"POST"];
        
        postRq.userInfo = @{kASIName: [tempDic objectForKey:kASIName]};
        
        NSDictionary *dataDic = [tempDic objectForKey:kASIData];
        for (NSString *key in dataDic) {
            
            id obj = [dataDic objectForKey:key];
            
            if ([obj isKindOfClass:[NSString class]]) {
                [basePost setPostValue:obj forKey:key];
            }
            else if ([obj isKindOfClass:[NSNumber class]]) {
                [basePost setPostValue:obj forKey:key];
            }
        }
        
        [baseQuene addOperation:postRq];
    }
    [baseQuene setMaxConcurrentOperationCount:1];
    baseQuene.shouldCancelAllRequestsOnFailure = NO;
    [baseQuene setRequestDidFinishSelector:@selector(asiPostFinished:)];
    [baseQuene setRequestDidFailSelector:@selector(asiPostFailed:)];
    [baseQuene setQueueDidFinishSelector:@selector(asiQueneFinish:)];
    
    [baseQuene go];
    
    
    
}
- (void)asiQueneFinish:(ASINetworkQueue *)rq {
    
}
- (void)asiClearn {
    [self asiDealloc:baseGet];
    [self asiDealloc:basePost];
    [self asiDealloc:baseQuene];
}
- (void)asiDealloc:(id)sender {
    
    if ([sender isMemberOfClass:[ASIHTTPRequest class]] || [sender isMemberOfClass:[ASIFormDataRequest class]]) {
        [sender clearDelegatesAndCancel];
        sender = nil;
    }
    if ([sender isMemberOfClass:[ASINetworkQueue class]]) {
        [sender setDelegate:nil];
        [(ASINetworkQueue *)sender cancelAllOperations];
        sender = nil;
    }
    
    
    
}


- (void)layerShadow:(UIView *)view {
    view.layer.shadowOffset = CGSizeZero;
    view.layer.shadowRadius = 3.0f;
    view.layer.shadowOpacity = 1.0f;
    view.layer.shadowPath = [UIBezierPath bezierPathWithRect:view.bounds].CGPath;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
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
