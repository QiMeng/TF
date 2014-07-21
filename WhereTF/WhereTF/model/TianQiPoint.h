//
//  TianQiPoint.h
//  Typhoon
//
//  Created by strongsoft on 14-7-16.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface TianQiPoint : MKPointAnnotation

@property (nonatomic, assign) float jd;
@property (nonatomic, assign) float wd;
@property (nonatomic, copy) NSString * city;
@property (nonatomic, copy) NSString * weather;


+ (id)itemFormDic:(NSDictionary *)dic;


+ (id)itemFormArray:(NSArray *)array;

@end
