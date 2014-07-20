//
//  ViewController.m
//  Typhoon
//
//  Created by strongsoft on 14-7-14.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import "ViewController.h"

#import "TaiFengPoint.h"
#import "HaiQuPoint.h"
#import "YuJingPoint.h"
#import "TianQiPoint.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    navTitle.text = @"去哪儿";
    [self rightNavBarImage:@"cog" withText:@""];
    [self leftNavBarImage:@"list" withText:@""];
    
    
    
    [self initUI];
 
    [self reloadUrlData];
    
}

- (void)reloadUrlData {
    
    NSString * haiquUrl = @"http://typhoon.weather.gov.cn/Typhoon/micaps?flag=1&time=24&type=inshore";
    haiquUrl = [haiquUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    
    NSString * tianqiUrl =@"http://typhoon.weather.gov.cn/Typhoon/proxy2.jsp?u=weather_level&p=1";
    tianqiUrl = [tianqiUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString * yujingUrl =@"http://typhoon.weather.gov.cn/Typhoon/proxy2.jsp?u=weather_alarm&p=3@province=@signallevel=@signaltype=";
    yujingUrl = [yujingUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    [self asiNetworkQueuesGet:@[@{kASIName: @"tianqi",
                                  kASIUrl: tianqiUrl},
                                @{kASIName: @"haiqu",
                                  kASIUrl: haiquUrl},
                                @{kASIName: @"yujing",
                                  kASIUrl:yujingUrl}]];
    
}



- (void)initUI {
    
    myMapView.frame = CGRectMake(kEmpty, kEmpty, self.view.width - 2*kEmpty, self.view.height - kEmpty - kMainBtnHeight);
    
    [myMapView viewLineColor:[UIColor whiteColor] borderWidth:kBorderWidth cornerRadius:0];
    
    float width = (myMapView.width - 2*kEmpty)/4.0;
    
    UIButton * tfbtn = [UIButton allocButtonFrame:CGRectMake(myMapView.left+kEmpty, myMapView.bottom-kBorderWidth, width, kMainBtnHeight)
                                      normalTitle:@"台风"
                                    selectedTitle:@"台风"
                                 normalTitleColor:[UIColor blackColor]
                               selectedTitleColor:[UIColor redColor]
                                  backgroundColor:nil
                                        titleFont:nil
                                      normalImage:nil
                                    selectedImage:nil
                                    normalBgImage:nil
                                  selectedBgImage:nil
                                           target:self
                                         selector:@selector(tfbtn:)
                                 autoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    [tfbtn viewLineColor:[UIColor whiteColor] borderWidth:kBorderWidth cornerRadius:0];
    [self.view addSubview:tfbtn];
    
    UIButton * hqbtn = [UIButton allocButtonFrame:CGRectMake(tfbtn.right,tfbtn.top, tfbtn.width, tfbtn.height)
                                      normalTitle:@"海区"
                                    selectedTitle:@"海区"
                                 normalTitleColor:[UIColor blackColor]
                               selectedTitleColor:[UIColor redColor]
                                  backgroundColor:nil
                                        titleFont:nil
                                      normalImage:nil
                                    selectedImage:nil
                                    normalBgImage:nil
                                  selectedBgImage:nil
                                           target:self
                                         selector:@selector(tfbtn:)
                                 autoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    [hqbtn viewLineColor:[UIColor whiteColor] borderWidth:kBorderWidth cornerRadius:0];
    [self.view addSubview:hqbtn];
    
    UIButton * yjBtn = [UIButton allocButtonFrame:CGRectMake(hqbtn.right,tfbtn.top, tfbtn.width, tfbtn.height)
                                      normalTitle:@"预警"
                                    selectedTitle:@"预警"
                                 normalTitleColor:[UIColor blackColor]
                               selectedTitleColor:[UIColor redColor]
                                  backgroundColor:nil
                                        titleFont:nil
                                      normalImage:nil
                                    selectedImage:nil
                                    normalBgImage:nil
                                  selectedBgImage:nil
                                           target:self
                                         selector:@selector(tfbtn:)
                                 autoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    [yjBtn viewLineColor:[UIColor whiteColor] borderWidth:kBorderWidth cornerRadius:0];
    [self.view addSubview:yjBtn];
    
    UIButton * tqBtn = [UIButton allocButtonFrame:CGRectMake(yjBtn.right,tfbtn.top, tfbtn.width, tfbtn.height)
                                      normalTitle:@"天气预报"
                                    selectedTitle:@"天气预报"
                                 normalTitleColor:[UIColor blackColor]
                               selectedTitleColor:[UIColor redColor]
                                  backgroundColor:nil
                                        titleFont:nil
                                      normalImage:nil
                                    selectedImage:nil
                                    normalBgImage:nil
                                  selectedBgImage:nil
                                           target:self
                                         selector:@selector(tfbtn:)
                                 autoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    [tqBtn viewLineColor:[UIColor whiteColor] borderWidth:kBorderWidth cornerRadius:0];
    [self.view addSubview:tqBtn];
    
    
    
    
}
- (void)tfbtn:(UIButton *)btn {
    btn.selected = !btn.selected;
    
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
    
    if ([asiname isEqualToString:@"tianqi"] && [data isKindOfClass:[NSArray class]]) {
        for (NSArray * pArray in data) {
            
            [myMapView addAnnotation:[TianQiPoint itemFormArray:pArray]];
            
        }
    }
    
    if ([asiname isEqualToString:@"yujing"] && [data isKindOfClass:[NSArray class]]) {
        for (NSArray * pArray in data) {
            
            [myMapView addAnnotation:[YuJingPoint itemFormArray:pArray]];
            
        }
    }
    
    [self mapRect];
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    
    MKPinAnnotationView *pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"ann"];
    
    if ([annotation isKindOfClass:[HaiQuPoint class]]) {
        
            pinView.pinColor = MKPinAnnotationColorGreen;//设置pinColor属性
        
    }else if ([annotation isKindOfClass:[TianQiPoint class]]) {
            pinView.pinColor = MKPinAnnotationColorPurple;//设置pinColor属性
        
    }else if ([annotation isKindOfClass:[YuJingPoint class]]) {
            pinView.pinColor = MKPinAnnotationColorRed;//设置pinColor属性
        
    }

    pinView.canShowCallout = YES;
    
    return pinView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
