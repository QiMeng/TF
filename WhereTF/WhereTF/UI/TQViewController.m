//
//  TQViewController.m
//  WhereTF
//
//  Created by QiMengJin on 14-7-20.
//  Copyright (c) 2014年 QiMengJin_LYS. All rights reserved.
//

#import "TQViewController.h"
#import "TQListViewController.h"
#import "TianQiPoint.h"
@interface TQViewController ()

@end

@implementation TQViewController

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
    navTitle.text = @"天气预报";
    [self rightNavBarImage:@"list" withText:@""];
    [self leftNavBarImage:@"cog" withText:@""];
    [self reloadUrl];
}

- (void)rightNavBar:(id)sender {
    
    TQListViewController * ctrl = [[TQListViewController alloc]init];
    [ctrl leftDefaultNavBar];
    ctrl.title = @"天气列表";
    [ctrl reloadArray:myMapView.annotations];
    [self.navigationController pushViewController:ctrl animated:YES];
    
}

- (void)reloadUrl {
    
    NSString * tianqiUrl =@"http://typhoon.weather.gov.cn/Typhoon/proxy2.jsp?u=weather_level&p=1";
    tianqiUrl = [tianqiUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self asiGetDic:@{kASIName: @"tianqi",
                      kASIUrl: tianqiUrl}];
    
}
#pragma mark - ASIHTTPRequest ----------------------------------------
- (void)asiGetFinished:(ASIHTTPRequest *)rq {
    NSString *requestString = [rq responseString];
    id data = [requestString objectFromJSONString];
    DLog(@"%@",data);
    
    NSString * asiname = [rq.userInfo objectForKeyNotNull:kASIName];
    
    if ([asiname isEqualToString:@"tianqi"] && [data isKindOfClass:[NSArray class]]) {
        for (NSArray * pArray in data) {
            
            [myMapView addAnnotation:[TianQiPoint itemFormArray:pArray]];
            
        }
    }
    
    [self mapRect];
    
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
    if ([view.annotation isKindOfClass:[MKUserLocation class]]) {
        // 点击当前位置
        return;
    }
    if (!currentPoint) {
        currentPoint = [[QMPoint alloc]init];
    }
    TianQiPoint *pinAnnotation = (TianQiPoint *)view.annotation;

    currentPoint.coordinate = pinAnnotation.coordinate;
    currentPoint.data = pinAnnotation;

    [myMapView addAnnotations:@[currentPoint]];
    [myMapView setCenterCoordinate:view.annotation.coordinate animated:YES];
    [myMapView selectAnnotation:currentPoint animated:YES];
    
    
}

- (void)changeAnnotationView:(QMAnnotationView *)view  {
    
    if ([view isKindOfClass:[QMAnnotationView class]]) {
        TianQiPoint * point = currentPoint.data;
        UILabel * pTitle = (UILabel *)[view.contentView viewWithTag:100];
        if (!pTitle) {
            pTitle = [UILabel allocLabelFrame:CGRectMake(0, 0, view.contentView.width, 30)
                                         text:@""
                                         font:[UIFont boldSystemFontOfSize:14]
                                    textColor:[UIColor blackColor]
                                      bgColor:nil
                               textAlignament:NSTextAlignmentCenter
                             autoresizingMask:UIViewAutoresizingNone];
            pTitle.tag = 100;
            [view.contentView addSubview:pTitle];
        }
        pTitle.text = point.city;
        
        
    }
}



- (void)annotationView:(MKAnnotationView *)view {
    
    view.backgroundColor = [UIColor greenColor];
    view.image = [UIImage imageNamed:@"cog"];
    
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
