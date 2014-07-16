//
//  HaiQuViewController.m
//  Typhoon
//
//  Created by strongsoft on 14-7-16.
//  Copyright (c) 2014年 ;. All rights reserved.
//

#import "HaiQuViewController.h"

@interface HaiQuViewController ()

@end

@implementation HaiQuViewController

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
    
    [self initUI];
    
}

#pragma mark - 初始化
- (void)initUI {

    UIButton * searchBtn = [UIButton allocButtonFrame:CGRectMake(10, 10, 100, 100)
                                          normalTitle:@"隐藏"
                                        selectedTitle:@""
                                     normalTitleColor:nil
                                   selectedTitleColor:nil
                                      backgroundColor:nil
                                            titleFont:nil
                                          normalImage:nil
                                        selectedImage:nil
                                        normalBgImage:nil
                                      selectedBgImage:nil
                                               target:self
                                             selector:@selector(hiddenView)
                                     autoresizingMask:UIViewAutoresizingNone];
    [self.view addSubview:searchBtn];
    
    
//    myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    myTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
//    
//    
//    [self.view addSubview:myTableView];
    
}


#pragma mark - 隐藏
- (void)hiddenView {
    
    _hiddenClickBlock(self);
    
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
