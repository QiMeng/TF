//
//  HaiQuPoint.m
//  Typhoon
//
//  Created by strongsoft on 14-7-16.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import "HaiQuPoint.h"

@implementation HaiQuPoint

+ (id)itemFormDic:(NSDictionary *)dic {
    
    
    HaiQuPoint * p = [[HaiQuPoint alloc]init];

    return p;
}

+ (id)itemFormArray:(NSArray *)array {
    
    HaiQuPoint * p = [[HaiQuPoint alloc]init];
    
    p.jd = [[array objectAtIndex:1] floatValue];
    p.wd = [[array objectAtIndex:2] floatValue];
    
    p.title = [array objectAtIndex:0];
    p.subtitle = [array objectAtIndex:15];
    
    
    p.coordinate = CLLocationCoordinate2DMake(p.wd ,p.jd);
    
    
    return p;
}



@end
