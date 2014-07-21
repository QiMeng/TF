//
//  TianQiPoint.h
//  Typhoon
//
//  Created by strongsoft on 14-7-16.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface TianQiPoint : MKPointAnnotation

@property (nonatomic, copy) NSString * city;//哈尔滨
@property (nonatomic, assign) float jd;
@property (nonatomic, assign) float wd;
@property (nonatomic, copy) NSString * riqi; //07月21日
@property (nonatomic, copy) NSString * weather;//晴-多云
@property (nonatomic, copy) NSString * wendu0;  //27.0
@property (nonatomic, copy) NSString * wendu1;  //18.0
@property (nonatomic, copy) NSString * tm;  //2014-07-21 18:00



+ (id)itemFormDic:(NSDictionary *)dic;


+ (id)itemFormArray:(NSArray *)array;

@end
