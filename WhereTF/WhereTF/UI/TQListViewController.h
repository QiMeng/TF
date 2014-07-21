//
//  TQListViewController.h
//  WhereTF
//
//  Created by QiMengJin on 14-7-21.
//  Copyright (c) 2014年 QiMengJin_LYS. All rights reserved.
//

#import "QMViewController.h"

@interface TQListViewController : QMViewController {
    
    UITableView * myTableView;
    
    NSMutableArray * baseArray;
    
}

- (void)reloadArray:(NSArray *)array;

@end
