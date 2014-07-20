//
//  BaseNavigationController.m
//  JinHuaIPAD
//
//  Created by strongsoft on 14-7-3.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

#import "QMNavigationController.h"

#import "QMCategory.h"

@interface QMNavigationController ()

@end

@implementation QMNavigationController

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
    
    if (IOS7) {
        [self navigationBarBackgroundImageName:@"navBgIOS7"];
    }else {
        [self navigationBarBackgroundImageName:@"navBg"];
    }
    
    
}

- (void)navigationBarBackgroundImageName:(NSString *)backgroundImageStr {
    
    float height = 0;
    UIImage *image = nil;
    if (IOS7) {
        height = 64;
        
    }else {
        height = 44;
    }
    image = [[UIImage imageNamed:backgroundImageStr] imageAliquotsTensile];
    
    if ([UINavigationBar instancesRespondToSelector:@selector(setBackgroundImage:forBarMetrics:)]){
        
        [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        [self.navigationBar setFrame:CGRectMake(0, 0, self.navigationBar.frame.size.width, height)];
    }else {
        
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.navigationBar.frame.size.width, height)];
        view.image = image;
        [self.navigationBar insertSubview:view atIndex:1];
        
        SAFE_RELEASE(view);
    }

    [self.view setNeedsDisplay];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
