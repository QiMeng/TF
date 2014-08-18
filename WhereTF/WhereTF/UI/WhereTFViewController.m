//
//  WhereTFViewController.m
//  WhereTF
//
//  Created by QiMengJin on 14-7-21.
//  Copyright (c) 2014年 QiMengJin_LYS. All rights reserved.
//

#import "WhereTFViewController.h"

@interface WhereTFViewController ()

@end

@implementation WhereTFViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)loadView {
    [super loadView];
    calloutViewSize = CGSizeMake(150, 150);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIButton * targetBtn = [UIButton allocButtonFrame:CGRectMake(kEmpty, kEmpty, 40, 40)
//                                          normalTitle:@""
//                                        selectedTitle:@""
//                                     normalTitleColor:nil
//                                   selectedTitleColor:nil
//                                      backgroundColor:[UIColor lightGrayColor]
//                                            titleFont:nil
//                                          normalImage:[UIImage imageNamed:@"target"]
//                                        selectedImage:nil
//                                        normalBgImage:nil
//                                      selectedBgImage:nil
//                                               target:self
//                                             selector:@selector(targetBtn:)
//                                     autoresizingMask:UIViewAutoresizingFlexibleRightMargin];
//    [targetBtn viewLineColor:[UIColor lightGrayColor] borderWidth:1 cornerRadius:3];
//    [myMapView addSubview:targetBtn];
    
    
}
- (void)targetBtn:(UIButton *)btn {
    
    [self mapRect];
    
}


-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    
    if ([annotation isKindOfClass:[QMPoint class]]) {
        QMAnnotationView *calloutView = (QMAnnotationView *) [myMapView dequeueReusableAnnotationViewWithIdentifier:@"calloutView"];
        
        if (calloutView == nil) {
            calloutView = [[QMAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"calloutView" frame:CGRectMake(0, 0, calloutViewSize.width, calloutViewSize.height)];
            [calloutView setCanShowCallout:NO];
        }else {
            calloutView.annotation = annotation;
        }
        
        [self changeAnnotationView:calloutView];
        
        calloutView.centerOffset = CGPointMake(0, -calloutView.height/2);
        
        return calloutView;
    }else {
        static NSString *placemarkIdentifier = @"my annotation identifier";
        
        MKAnnotationView *annotationView = [myMapView dequeueReusableAnnotationViewWithIdentifier:placemarkIdentifier];
        if (annotationView == nil)
        {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:placemarkIdentifier];
            [annotationView setCanShowCallout:NO];
            
            UIButton * button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            annotationView.rightCalloutAccessoryView = button;
            annotationView.opaque = NO;
            annotationView.draggable = YES;
            annotationView.selected = YES;
            
        }
        else
            annotationView.annotation = annotation;
        
        
        if (![annotationView.annotation isKindOfClass:[MKUserLocation class]]) {
            [self annotationView:annotationView];
        }
        
        
        return annotationView;
    }
    
    return nil;
    
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
    //    if ([view.annotation isKindOfClass:[MKUserLocation class]]) {
    //        // 点击当前位置
    //        return;
    //    }
    //    if (!currentPoint) {
    //        currentPoint = [[QMPoint alloc]init];
    //    }
    //    DzzhPoint *pinAnnotation = (DzzhPoint *)view.annotation;
    //
    //    currentPoint.coordinate = pinAnnotation.coordinate;
    //    currentPoint.data = pinAnnotation;
    //
    //    [myMapView addAnnotations:@[currentPoint]];
    //    [myMapView setCenterCoordinate:view.annotation.coordinate animated:YES];
    //    [myMapView selectAnnotation:currentPoint animated:YES];
    
    
}


- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    
    if ([view.annotation isKindOfClass:[QMPoint class]]) {
        [myMapView removeAnnotation:view.annotation];
    }
    
}


- (void)changeAnnotationView:(QMAnnotationView *)view  {
    
    if ([view isKindOfClass:[QMAnnotationView class]]) {
        
    }
}


- (void)annotationView:(MKAnnotationView *)view {
    

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
