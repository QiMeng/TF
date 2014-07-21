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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton * targetBtn = [UIButton allocButtonFrame:CGRectMake(kEmpty, kEmpty, 40, 40)
                                          normalTitle:@""
                                        selectedTitle:@""
                                     normalTitleColor:nil
                                   selectedTitleColor:nil
                                      backgroundColor:[UIColor lightGrayColor]
                                            titleFont:nil
                                          normalImage:[UIImage imageNamed:@"target"]
                                        selectedImage:nil
                                        normalBgImage:nil
                                      selectedBgImage:nil
                                               target:self
                                             selector:@selector(targetBtn:)
                                     autoresizingMask:UIViewAutoresizingFlexibleRightMargin];
    [targetBtn viewLineColor:[UIColor lightGrayColor] borderWidth:1 cornerRadius:3];
    [myMapView addSubview:targetBtn];
    
    
}
- (void)targetBtn:(UIButton *)btn {
    
    [self mapRect];
    
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
