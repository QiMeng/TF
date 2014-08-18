//
//  WhereTFViewController.h
//  WhereTF
//
//  Created by QiMengJin on 14-7-21.
//  Copyright (c) 2014年 QiMengJin_LYS. All rights reserved.
//

#import "QMMapViewController.h"
#import "QMPoint.h"
#import "QMAnnotationView.h"

@interface WhereTFViewController : QMMapViewController {
    
        QMPoint * currentPoint;
    
        CGSize calloutViewSize;
    
}

@end
