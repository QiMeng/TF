//
//  HQViewController.h
//  WhereTF
//
//  Created by QiMengJin on 14-7-20.
//  Copyright (c) 2014年 QiMengJin_LYS. All rights reserved.
//

#import "QMMapViewController.h"
@class HQInfoView;
@interface HQViewController : QMMapViewController {
    
    
    HQInfoView * infoView;
    
}

@property (nonatomic, copy) NSString * urlString;

@end
