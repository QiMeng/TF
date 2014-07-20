//
//  ViewController.m
//  Typhoon
//
//  Created by strongsoft on 14-7-14.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import "ViewController.h"

#import "TaiFengPoint.h"
#import "HaiQuPoint.h"
#import "YuJingPoint.h"
#import "TianQiPoint.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    navTitle.text = @"去哪儿";
    
    
    [self initUI];
    
    
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:.3];
    
}

- (void)initUI {
    
    myMapView.frame = CGRectMake(kEmpty, kEmpty, (self.navigationController.view.width-kEmpty*3)/2, self.view.height - kEmpty*2);
    
    myMapView.autoresizingMask =UIViewAutoresizingNone;
    [myMapView viewLineColor:[UIColor whiteColor] borderWidth:3 cornerRadius:3];
    

    modelView = [[UIView alloc]initWithFrame:CGRectMake(myMapView.right+20, myMapView.top, myMapView.width, myMapView.height)];
    modelView.autoresizingMask = UIViewAutoresizingNone;
    [modelView viewLineColor:[UIColor whiteColor] borderWidth:3 cornerRadius:3];
    
    [self.view addSubview:modelView];
    
    
    
    
    
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) { // 横屏
        
        myMapView.frame = CGRectMake(kEmpty, kEmpty, (self.navigationController.view.height-kEmpty*3)/2.0, self.view.height - kEmpty*2);
        

        modelView.frame = CGRectMake(myMapView.right+kEmpty, myMapView.top, myMapView.width, myMapView.height);
        
    }else {
        
       myMapView.frame = CGRectMake(kEmpty, kEmpty, (self.navigationController.view.width-kEmpty*2), (self.view.height - kEmpty*3)/2);

        modelView.frame = CGRectMake(myMapView.left, myMapView.bottom+kEmpty, myMapView.width, myMapView.height);
        
    }
    

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
