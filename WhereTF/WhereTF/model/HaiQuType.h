//
//  HaiQuType.h
//  Typhoon
//
//  Created by strongsoft on 14-7-17.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HaiQuType : NSObject

@property (nonatomic, copy) NSString * title;
@property (nonatomic, assign) BOOL isSelect;


+ (id) itemFormDic:(NSDictionary *)dic;
+ (id) itemFormStr:(NSString *)str;

@end
