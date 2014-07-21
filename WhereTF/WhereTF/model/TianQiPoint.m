//
//  TianQiPoint.m
//  Typhoon
//
//  Created by strongsoft on 14-7-16.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import "TianQiPoint.h"

@implementation TianQiPoint


+ (id)itemFormDic:(NSDictionary *)dic {
    
    
    TianQiPoint * p = [[TianQiPoint alloc]init];
    
    return p;
}

+ (id)itemFormArray:(NSArray *)array {
    
    TianQiPoint * p = [[TianQiPoint alloc]init];
    
    p.city = [array objectAtIndex:0];
    p.jd = [[array objectAtIndex:2] floatValue];
    p.wd = [[array objectAtIndex:1] floatValue];
    p.riqi = [array objectAtIndex:3];
    p.weather = [array objectAtIndex:4];
    p.wendu0 = [array objectAtIndex:5];
    p.wendu1 = [array objectAtIndex:7];
    p.tm = [array objectAtIndex:13];
    
    p.title = p.city;
    p.subtitle = p.weather;
    
    p.coordinate = CLLocationCoordinate2DMake(p.wd ,p.jd);
    
    return p;
}


@end
