//
//  HaiQuType.m
//  Typhoon
//
//  Created by strongsoft on 14-7-17.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import "HaiQuType.h"

@implementation HaiQuType

+ (id) itemFormDic:(NSDictionary *)dic {
    HaiQuType * h = [[HaiQuType alloc]init];
    
    return h;
}

+ (id) itemFormStr:(NSString *)str {
    HaiQuType * h = [[HaiQuType alloc]init];
    h.title = str;
    h.isSelect = NO;
    return h;
}

@end
