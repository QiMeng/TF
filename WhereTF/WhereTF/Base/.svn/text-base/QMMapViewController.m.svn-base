//
//  QMMapViewController.m
//  JinHuaIPAD
//
//  Created by strongsoft on 14-7-8.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import "QMMapViewController.h"


@interface QMMapViewController ()

@end

@implementation QMMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    myMapView.delegate = self;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    myMapView.delegate = nil;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (!myMapView) {
        
        myMapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
        myMapView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        myMapView.delegate = self;
        
    }
    if([self.view.subviews indexOfObject:myMapView] == NSNotFound){
        [self.view addSubview:myMapView];
    }
    
}

- (void) mapRect{
    if (myMapView && myMapView.annotations.count) {
        float xMin = FLT_MAX;
        float yMin = FLT_MAX;
        float xMax = -FLT_MAX;
        float yMax = -FLT_MAX;
        for(int idx=0;idx<[myMapView.annotations count] ;idx++){
            
            MKPointAnnotation* ann = [myMapView.annotations objectAtIndex:idx];
            MKMapPoint annotationPoint = MKMapPointForCoordinate(ann.coordinate);
            if(annotationPoint.x < xMin){
                xMin = annotationPoint.x;
            }
            if(annotationPoint.y < yMin){
                yMin = annotationPoint.y;
            }
            
            if(annotationPoint.x > xMax){
                xMax = annotationPoint.x;
            }
            if(annotationPoint.y > yMax){
                yMax = annotationPoint.y;
            }
        }

        MKMapRect bounds = MKMapRectMake(xMin, yMin,fabs(xMax - xMin), fabs(yMax - yMin));
        [myMapView setVisibleMapRect:bounds edgePadding:UIEdgeInsetsMake(50, 50, 50, 50) animated:YES];
    }
}

- (void)leftNavBar:(id)sender {

    myMapView.delegate = nil;
    [super leftNavBar:sender];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    myMapView.delegate = nil;
    
    QMRelease(myWebView);
    
#if ! __has_feature(objc_arc)
    [super dealloc];
#else
    
#endif
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
