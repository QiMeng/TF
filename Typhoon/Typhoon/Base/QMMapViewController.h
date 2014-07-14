//
//  QMMapViewController.h
//  JinHuaIPAD
//
//  Created by strongsoft on 14-7-8.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import "QMViewController.h"

#import <MapKit/MapKit.h>

@interface QMMapViewController : QMViewController <MKMapViewDelegate> {
    
    MKMapView * myMapView;
    
}


/**
 *  调整地图范围
 */
- (void) mapRect;

@end
