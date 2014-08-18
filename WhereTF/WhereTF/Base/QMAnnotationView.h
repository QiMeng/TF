//
//  QMAnnotationView.h
//  JinHuaIPAD
//
//  Created by strongsoft on 14-7-22.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface QMAnnotationView : MKAnnotationView

@property (nonatomic, retain) UIView *contentView;

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier frame:(CGRect)frame;

- (MKCoordinateRegion)adjustMapViewRegion;

@end
