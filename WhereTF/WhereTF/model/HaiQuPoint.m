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
    
    p.diqu = [array objectAtIndex:0];
    p.jd = [[array objectAtIndex:1] floatValue];
    p.wd = [[array objectAtIndex:2] floatValue];
    p.temp3 = [[array objectAtIndex:3] floatValue];
    p.weather0 = [array objectAtIndex:4];
    p.weather1 = [array objectAtIndex:5];
    p.winddir = [array objectAtIndex:6];
    p.temp7 = [array objectAtIndex:7];
    p.windpower0 = [array objectAtIndex:8];
    p.windpower1 = [array objectAtIndex:9];
    p.visibility0 = [[array objectAtIndex:10] floatValue];
    p.visibility1 = [[array objectAtIndex:11] floatValue];
    p.temp12 = [[array objectAtIndex:12] floatValue];
    p.temp13 = [[array objectAtIndex:13] floatValue];
    p.temp14 = [[array objectAtIndex:14] floatValue];
    p.content = [array objectAtIndex:15];
 
    p.infoMap = [NSString stringWithFormat:@"%@\n天气现象:%@ 转 %@ \n",
                 p.diqu,p.weather0,p.weather1];
    
    
    p.coordinate = CLLocationCoordinate2DMake(p.wd ,p.jd);
    
    
    return p;
}



@end
