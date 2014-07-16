//
//  HaiQuViewController.h
//  Typhoon
//
//  Created by strongsoft on 14-7-16.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import "QMViewController.h"

@interface HaiQuViewController : QMViewController {
    UITableView * myTableView;
}

@property (copy) void (^showDataMapClick)(NSArray * array);

@property (copy) void (^hiddenClickBlock)(id sender);

@end
