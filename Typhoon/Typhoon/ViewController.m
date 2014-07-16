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
    
    [self initBottom];
    
    [self initRightView];
    
    
}
#pragma mark - 底层视图
- (void)initBottom {
    
    //创建底部视图
    UIView *  bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.height - 49, 49*4+20, 49)];
    bottomView.center = CGPointMake(self.view.center.x, bottomView.center.y);
    bottomView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:bottomView];
    
    //创建底部视图背景
    UIImageView * bottomBg = [[UIImageView alloc]initWithFrame:CGRectMake(0, bottomView.height/2, bottomView.width, bottomView.height/2)];
    bottomBg.image = [UIImage imageAliquotsTensile:kBottomBg];
    bottomBg.backgroundColor = bottomBg.image?[UIColor clearColor]:[UIColor redColor];
    [bottomView addSubview:bottomBg];
    
    float btnWidth = (bottomBg.width - 20)/4;
    
    UIImage * pImage = [UIImage imageNamed:kBottomIcon_Taifeng_n];
    
    //创建底部台风按钮
    UIButton * taifengBtn = [UIButton allocButtonFrame:CGRectMake(10, 0, btnWidth, bottomView.height)
                                           normalTitle:pImage?@"":@"台风"
                                         selectedTitle:@""
                                      normalTitleColor:nil
                                    selectedTitleColor:nil
                                       backgroundColor:pImage?[UIColor clearColor]:[UIColor yellowColor]
                                             titleFont:nil
                                           normalImage:[UIImage imageNamed:kBottomIcon_Taifeng_n]
                                         selectedImage:[UIImage imageNamed:kBottomIcon_Taifeng_s]
                                         normalBgImage:nil
                                       selectedBgImage:nil
                                                target:self
                                              selector:@selector(taifengBtn:)
                                      autoresizingMask:UIViewAutoresizingNone];
    [bottomView addSubview:taifengBtn];
    
    //创建底部海区预报
    UIButton * haiquBtn = [UIButton allocButtonFrame:CGRectMake(taifengBtn.right, taifengBtn.top, btnWidth, bottomView.height)
                                           normalTitle:pImage?@"":@"海区"
                                         selectedTitle:@""
                                      normalTitleColor:nil
                                    selectedTitleColor:nil
                                       backgroundColor:pImage?[UIColor clearColor]:[UIColor purpleColor]
                                             titleFont:nil
                                           normalImage:[UIImage imageNamed:kBottomIcon_Haiqu_n]
                                         selectedImage:[UIImage imageNamed:kBottomIcon_Haiqu_s]
                                         normalBgImage:nil
                                       selectedBgImage:nil
                                                target:self
                                              selector:@selector(haiquBtn:)
                                      autoresizingMask:UIViewAutoresizingNone];
    [bottomView addSubview:haiquBtn];

    //创建底部预警
    UIButton * yujingBtn = [UIButton allocButtonFrame:CGRectMake(haiquBtn.right, haiquBtn.top, btnWidth, bottomView.height)
                                         normalTitle:pImage?@"":@"预警"
                                       selectedTitle:@""
                                    normalTitleColor:nil
                                  selectedTitleColor:nil
                                     backgroundColor:pImage?[UIColor clearColor]:[UIColor brownColor]
                                           titleFont:nil
                                         normalImage:[UIImage imageNamed:kBottomIcon_Yujing_n]
                                       selectedImage:[UIImage imageNamed:kBottomIcon_Yujing_s]
                                       normalBgImage:nil
                                     selectedBgImage:nil
                                              target:self
                                            selector:@selector(yujingBtn:)
                                    autoresizingMask:UIViewAutoresizingNone];
    [bottomView addSubview:yujingBtn];

    //创建底部天气
    UIButton * tianqiBtn = [UIButton allocButtonFrame:CGRectMake(yujingBtn.right, yujingBtn.top, btnWidth, bottomView.height)
                                          normalTitle:pImage?@"":@"天气"
                                        selectedTitle:@""
                                     normalTitleColor:nil
                                   selectedTitleColor:nil
                                      backgroundColor:pImage?[UIColor clearColor]:[UIColor magentaColor]
                                            titleFont:nil
                                          normalImage:[UIImage imageNamed:kBottomIcon_Yujing_n]
                                        selectedImage:[UIImage imageNamed:kBottomIcon_Yujing_s]
                                        normalBgImage:nil
                                      selectedBgImage:nil
                                               target:self
                                             selector:@selector(tianqiBtn:)
                                     autoresizingMask:UIViewAutoresizingNone];
    [bottomView addSubview:tianqiBtn];
    
}

#pragma mark - 右边设置界面
- (void)initRightView {
    
    __block ViewController *blockSelf = self;
    
    if (!haiquCtrl) {
        haiquCtrl = [[HaiQuViewController alloc]init];
        haiquCtrl.view.frame = CGRectMake(10, 10, self.view.width - 20, self.view.height - 100);
        [self layerShadow:haiquCtrl.view];
        
        haiquCtrl.hiddenClickBlock = ^(id sender) {
            [blockSelf hiddenCtrl:sender];
        };
        
//        rightCtrl.hiddenClickBlock = ^(id sender) {
//            [self hiddenRightCtrl];
//        };
        
        
        [self.view addSubview:haiquCtrl.view];
    }
    
    
}
- (void)showCtrl:(UIViewController *)ctrl {
    
    if (!ctrl.view.alpha) {
        
        [UIView animateWithDuration:.3 animations:^{
            ctrl.view.alpha = 1;
        }];
    }
}
- (void)hiddenCtrl:(UIViewController *)ctrl {
    
    if (ctrl.view.alpha) {
        
        [UIView animateWithDuration:.3 animations:^{
            ctrl.view.alpha = 0;
        }];
    }
}

#pragma mark - 底部 台风
- (void)taifengBtn:(UIButton *)btn {
    btn.selected = !btn.selected;
    
    if (btn.selected) {
        DLog(@"选中台风");
    }else {
        DLog(@"没选中台风");
    }
    
}
#pragma mark - 底部 海区
- (void)haiquBtn:(UIButton *)btn {
    btn.selected = !btn.selected;
    if (btn.selected) {
        DLog(@"选中台风");
        [self showCtrl:haiquCtrl];
    }else {
        DLog(@"没选中台风");
        [self hiddenCtrl:haiquCtrl];
    }
}
#pragma mark - 底部 预警
- (void)yujingBtn:(UIButton *)btn {
    btn.selected = !btn.selected;
    if (btn.selected) {
        DLog(@"选中台风");
    }else {
        DLog(@"没选中台风");
    }
}

#pragma mark - 底部 天气
- (void)tianqiBtn:(UIButton *)btn {
    btn.selected = !btn.selected;
    if (btn.selected) {
        DLog(@"选中台风");
    }else {
        DLog(@"没选中台风");
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
