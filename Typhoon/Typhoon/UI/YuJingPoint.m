//
//  YuJingPoint.m
//  Typhoon
//
//  Created by strongsoft on 14-7-16.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import "YuJingPoint.h"

@implementation YuJingPoint


+ (id)itemFormDic:(NSDictionary *)dic {
    
    
    YuJingPoint * p = [[YuJingPoint alloc]init];
    
    return p;
}

+ (id)itemFormArray:(NSArray *)array {
    
    YuJingPoint * p = [[YuJingPoint alloc]init];
    
    p.jd = [[array objectAtIndex:8] floatValue];
    p.wd = [[array objectAtIndex:7] floatValue];
    
    
    p.title = [array objectAtIndex:0];
    p.subtitle = [array objectAtIndex:3];
    
    
    p.coordinate = CLLocationCoordinate2DMake(p.wd ,p.jd);
    
    
    return p;
}


@end
