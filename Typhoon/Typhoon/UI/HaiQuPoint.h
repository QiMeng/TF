//
//  HaiQuPoint.h
//  Typhoon
//
//  Created by strongsoft on 14-7-16.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface HaiQuPoint : MKPointAnnotation

@property (nonatomic, copy) NSString * diqu;        //地区
@property (nonatomic, assign) float jd;
@property (nonatomic, assign) float wd;
@property (nonatomic, assign) float temp0;          //未知
@property (nonatomic, copy) NSString * tianqi0;    //请
@property (nonatomic, copy) NSString * tianqi1;    //晴
@property (nonatomic, copy) NSString * fengxiang;   //西南风

@property (nonatomic, copy) NSString * temp1;       //未知


+ (id)itemFormDic:(NSDictionary *)dic;


+ (id)itemFormArray:(NSArray *)array;




@end
