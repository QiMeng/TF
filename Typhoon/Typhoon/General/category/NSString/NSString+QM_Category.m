//
//  NSString+QM_Category.m
//  JinHuaIPAD
//
//  Created by strongsoft on 14-7-3.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import "NSString+QM_Category.h"
#import "QMCategory.h"


@implementation NSString (QM_Category)

#pragma mark - 时间转换 ------------------------------------------------
+ (NSDateFormatter *)setForMatter:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    QMAutorelease(formatter);
    return formatter;
}
#pragma mark - 默认格式 - 当前时间 - @"yyyy-MM-dd HH:mm"
+ (NSString *)currentDefaultTime {
    return [self forMatter:kDefaultFormatter date:[NSDate date] ];
}
#pragma mark - 默认格式- 时间 - @"yyyy-MM-dd HH:mm"
+ (NSString *)defaultDate:(NSDate *)date {
    return [self forMatter:kDefaultFormatter date:date];
}
#pragma mark - 自定义格式 将 时间 转换 字符串 
+ (NSString *)forMatter:(NSString *)matter date:(NSDate *)date {
    return [[NSString setForMatter:matter] stringFromDate:date];
}

#pragma mark - 自定义格式 将 字符串 转换 时间
+ (NSDate *)forMatter:(NSString *)matter time:(NSString *)time {
    return [[NSString setForMatter:matter] dateFromString:time];
}

#pragma mark - 根据传入的时间,和 小时 数 ,调整时间 并返回 时间NSString
+ (NSString *)adjustForMatter:(NSString *)matter Time:(NSString *)time afterHour:(int)hour {
    
    NSDate* date = [[NSString setForMatter:matter] dateFromString:time];
    if (!date) {
        return nil;
    }
    NSTimeInterval interval = [date timeIntervalSince1970];
    interval = interval + hour;
    NSDate *timeDate = [NSDate dateWithTimeIntervalSince1970:interval];
    NSString* dateString = [[NSString setForMatter:matter] stringFromDate:timeDate];
    return dateString;
    
}

#pragma mark - 比较两个时间
+ (int)compareDate:(NSDate*)dt1 withDate:(NSDate*)dt2{
    int ci;
    NSComparisonResult result = [dt1 compare:dt2];
    switch (result)
    {
            //dt2比dt1大
        case NSOrderedAscending: ci=1; break;
            //dt2比dt1小
        case NSOrderedDescending: ci=-1; break;
            //dt2=dt1
        case NSOrderedSame: ci=0; break;
        default: NSLog(@"erorr dates %@, %@", dt2, dt1); break;
    }
    return ci;
}

#pragma mark - 其他方法 ------------------------------------------------
#pragma mark - 生成一个唯一识别码
+ (NSString*) stringWithGUID {
    CFUUIDRef uuidObj = CFUUIDCreate(nil);
    NSString *uuidString = (NSString *)CFBridgingRelease(CFUUIDCreateString(nil, uuidObj));
    CFRelease(uuidObj);
    return uuidString ;
}
#pragma mark - 根据标题,字体大小 获取字体的长宽
- (CGSize )sizeFromString:(NSString *)text andFontSize:(NSInteger)size  {
    CGSize textSize = [text sizeWithFont:[UIFont boldSystemFontOfSize:size]];
    return textSize;
}


#pragma mark - 本地路径
+ (NSString *)docsPathString {
    NSString* docsdir = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    return docsdir;
}

@end
