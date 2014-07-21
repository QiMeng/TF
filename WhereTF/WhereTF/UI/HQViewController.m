//
//  HQViewController.m
//  WhereTF
//
//  Created by QiMengJin on 14-7-20.
//  Copyright (c) 2014年 QiMengJin_LYS. All rights reserved.
//

#import "HQViewController.h"

#import "HaiQuPoint.h"
#import "HQInfoView.h"

@interface HQViewController ()

@end

@implementation HQViewController

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
    navTitle.text = @"海区预报";
    
    [self rightNavBarImage:@"cog" withText:@""];
    [self leftNavBarImage:@"list" withText:@""];
    
    [self reloadUrlTime:@"24" Type:@"inshore"];
    
    
    if (!infoView) {
        infoView = [[HQInfoView alloc]initWithFrame:CGRectMake(kEmpty, kEmpty, self.view.width/2, 0)];
        [self.view addSubview:infoView];
    }
    
}

- (void)reloadUrlTime:(NSString *)time Type:(NSString *)type {
    
    NSString * haiquUrl = [NSString stringWithFormat:@"http://typhoon.weather.gov.cn/Typhoon/micaps?flag=1&time=%@&type=%@",time,type];
    haiquUrl = [haiquUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [self asiGetDic:@{kASIName: @"haiqu",
                      kASIUrl: haiquUrl}];
    
}

#pragma mark - ASIHTTPRequest ----------------------------------------
- (void)asiGetFinished:(ASIHTTPRequest *)rq {
    NSString *requestString = [rq responseString];
    id data = [requestString objectFromJSONString];
    DLog(@"%@",data);
    
    NSString * asiname = [rq.userInfo objectForKeyNotNull:kASIName];
    if ([asiname isEqualToString:@"haiqu"] && [data isKindOfClass:[NSArray class]]) {
        
        for (NSArray * pArray in data) {
            
            [myMapView addAnnotation:[HaiQuPoint itemFormArray:pArray]];
            
        }
        
    }

    [self mapRect];
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    
    MKPinAnnotationView *pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"ann"];
    
    if ([annotation isKindOfClass:[HaiQuPoint class]]) {
        
        pinView.pinColor = MKPinAnnotationColorGreen;//设置pinColor属性
        
    }
    
    return pinView;
}
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    view.transform = CGAffineTransformScale(view.transform, 1.5, 1.5);
    
    [self showInfoView];
    HaiQuPoint * point = view.annotation;
    
    infoView.infoLabel.text = point.infoMap;
    
    
}
- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    
    view.transform=CGAffineTransformIdentity;
    
    [self hiddenInfoView];
}

- (void)showInfoView {

    
    [UIView animateWithDuration:.3 animations:^{
        [infoView setHeight:200];
    }];
    
}
- (void)hiddenInfoView {
    
    [UIView animateWithDuration:.3 animations:^{
        [infoView setHeight:0];
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
