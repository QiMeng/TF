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
    
    p.jd = [[array objectAtIndex:2] floatValue];
    p.wd = [[array objectAtIndex:1] floatValue];
    
    
    p.title = [array objectAtIndex:0];
    p.subtitle = [array objectAtIndex:4];
    
    
    p.coordinate = CLLocationCoordinate2DMake(p.wd ,p.jd);
    
    
    return p;
}


@end
