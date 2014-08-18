//
//  QMAnnotationView.m
//  JinHuaIPAD
//
//  Created by strongsoft on 14-7-22.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import "QMAnnotationView.h"

#define Arror_height 5
#define kMargins 3

@implementation QMAnnotationView

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier frame:(CGRect)frame{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.canShowCallout = NO;
        self.frame = frame;
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake(kMargins, kMargins, self.frame.size.width - kMargins*2, self.frame.size.height - Arror_height - kMargins*2)];
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView viewLineColor:self.contentView.backgroundColor borderWidth:0 cornerRadius:5];
        
        [self addSubview:self.contentView];
        
        
        
    }
    
    return self;
}



- (MKMapView *)mapView{
	UIView *outerView = self.superview;
	while (outerView!=nil) {
		if([outerView isKindOfClass:[MKMapView class]]){
			return (MKMapView *)outerView;
		}else{
			outerView = outerView.superview;
		}
	}
	return nil;
}

- (MKCoordinateRegion)adjustMapViewRegion{
	MKMapView *mapView = [self mapView];
	CGRect calloutViewFrameInMap = [mapView convertRect:_contentView.frame fromView:self];
	CGRect mapViewBounds = mapView.bounds;
	MKCoordinateRegion region = mapView.region;
	MKCoordinateRegion deta;
	CGFloat space = 10;	//邊距
	if(CGRectGetMinX(calloutViewFrameInMap)<CGRectGetMinX(mapViewBounds)){
		deta = [mapView convertRect:CGRectMake(0, 0, space+CGRectGetMinX(mapViewBounds)-CGRectGetMinX(calloutViewFrameInMap), 1) toRegionFromView:self];
		region.center.longitude -= deta.span.longitudeDelta;
	}else if(CGRectGetMaxX(calloutViewFrameInMap)>CGRectGetMaxX(mapViewBounds)){
		deta = [mapView convertRect:CGRectMake(0, 0, space+CGRectGetMaxX(calloutViewFrameInMap)-CGRectGetMaxX(mapViewBounds), 1) toRegionFromView:self];
		region.center.longitude += deta.span.longitudeDelta;
	}
	if(CGRectGetMinY(calloutViewFrameInMap)<CGRectGetMinY(mapViewBounds)){
		deta = [mapView convertRect:CGRectMake(0, 0, 1,space+CGRectGetMinY(mapViewBounds)-CGRectGetMinY(calloutViewFrameInMap)) toRegionFromView:self];
		region.center.latitude += deta.span.latitudeDelta;
	}else if(CGRectGetMaxY(calloutViewFrameInMap)>CGRectGetMaxY(mapViewBounds)){
		deta = [mapView convertRect:CGRectMake(0, 0, 1,space+CGRectGetMaxY(calloutViewFrameInMap)-CGRectGetMaxY(mapViewBounds)) toRegionFromView:self];
		region.center.latitude -= deta.span.latitudeDelta;
	}
	return region;
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    [self drawInContext:UIGraphicsGetCurrentContext()];
}

- (void)drawInContext:(CGContextRef)context {
    CGContextSetLineWidth(context, 2.0);
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0 green:0 blue:0 alpha:.5].CGColor);
    
    [self getDrawPath:context];
    CGContextFillPath(context);
}

- (void)getDrawPath:(CGContextRef)context {
    
    
    CGRect rrect = self.bounds;
    CGFloat radius = 8.0;
    CGFloat minx = CGRectGetMinX(rrect);
    CGFloat midx = CGRectGetMidX(rrect);
    
    CGFloat maxx = CGRectGetMaxX(rrect);
    
    CGFloat miny = CGRectGetMinY(rrect);
    CGFloat maxy = CGRectGetMaxY(rrect)-Arror_height;
    // 画CalloutView下面的小三角
    CGContextMoveToPoint(context, midx + Arror_height, maxy);
    CGContextAddLineToPoint(context, midx, maxy + Arror_height);
    CGContextAddLineToPoint(context, midx - Arror_height, maxy);
    //
    CGContextAddArcToPoint(context, minx, maxy, minx, miny, radius);
    CGContextAddArcToPoint(context, minx, minx, maxx, miny, radius);
    CGContextAddArcToPoint(context, maxx, miny, maxx, maxx, radius);
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
    CGContextClosePath(context);
}

@end
