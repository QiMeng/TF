//
//  ViewController.m
//  WhereTF
//
//  Created by QiMengJin on 14-7-20.
//  Copyright (c) 2014年 QiMengJin_LYS. All rights reserved.
//

#import "ViewController.h"

#import "TFViewController.h"
#import "HQViewController.h"
#import "YJViewController.h"
#import "TQViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
  
    //台风
    TFViewController * tfCtrl = [[TFViewController alloc]init];
    QMNavigationController * tfNav = [[QMNavigationController alloc]initWithRootViewController:tfCtrl];
    
    //海区
    HQViewController * hqCtrl = [[HQViewController alloc]init];
    QMNavigationController * hqNav = [[QMNavigationController alloc]initWithRootViewController:hqCtrl];
    //预警
    YJViewController * yjCtrl = [[YJViewController alloc]init];
    QMNavigationController * yjNav = [[QMNavigationController alloc]initWithRootViewController:yjCtrl];
    //天气预报
    TQViewController * tqCtrl = [[TQViewController alloc]init];
    QMNavigationController * tqNav = [[QMNavigationController alloc]initWithRootViewController:tqCtrl];
    
    self.viewControllers = @[tfNav,hqNav,yjNav,tqNav];
    
    UITabBarItem *tabBarItem0 = [self.tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem1 = [self.tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem2 = [self.tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem3 = [self.tabBar.items objectAtIndex:3];
    
    tabBarItem0.title = @"台风";
    tabBarItem1.title = @"海区";
    tabBarItem2.title = @"预警";
    tabBarItem3.title = @"天气预报";


    self.selectedIndex = 0;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
