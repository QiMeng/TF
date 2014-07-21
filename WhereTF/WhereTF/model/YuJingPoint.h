//
//  YuJingPoint.h
//  Typhoon
//
//  Created by strongsoft on 14-7-16.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface YuJingPoint : MKPointAnnotation

@property (nonatomic, assign) float jd;
@property (nonatomic, assign) float wd;


+ (id)itemFormDic:(NSDictionary *)dic;


+ (id)itemFormArray:(NSArray *)array;

@end
