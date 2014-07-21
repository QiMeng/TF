//
//  HaiQuPoint.h
//  Typhoon
//
//  Created by strongsoft on 14-7-16.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface HaiQuPoint : MKPointAnnotation

@property (nonatomic, copy) NSString * diqu;        //地区: 渤海北部沿岸
@property (nonatomic, assign) float jd;             //精度
@property (nonatomic, assign) float wd;             //纬度
@property (nonatomic, assign) float temp3;
@property (nonatomic, copy) NSString * weather0;    //多云
@property (nonatomic, copy) NSString * weather1;    //中雨
@property (nonatomic, copy) NSString * winddir;        //南风
@property (nonatomic, copy) NSString * temp7;       //null
@property (nonatomic, copy) NSString * windpower0;  //风力: 5~6
@property (nonatomic, copy) NSString * windpower1;  //风力: 4~5
@property (nonatomic, assign) float visibility0;  //能见度: 12
@property (nonatomic, assign) float visibility1;  //能见度: 8
@property (nonatomic, assign) float temp12;
@property (nonatomic, assign) float temp13;
@property (nonatomic, assign) float temp14;
@property (nonatomic, copy) NSString * content;       //内容

@property (nonatomic, copy) NSString * infoMap; //在地图上显示的数据


+ (id)itemFormDic:(NSDictionary *)dic;


+ (id)itemFormArray:(NSArray *)array;




@end
