//
//  TQListViewController.m
//  WhereTF
//
//  Created by QiMengJin on 14-7-21.
//  Copyright (c) 2014年 QiMengJin_LYS. All rights reserved.
//

#import "TQListViewController.h"
#import "TianQiPoint.h"
@interface TQListViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation TQListViewController

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
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(kEmpty, kEmpty, self.view.width - 2*kEmpty, self.view.height - 2*kEmpty)];
    myTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [myTableView viewLineColor:[UIColor lightGrayColor] borderWidth:1 cornerRadius:3];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    
}

- (void)reloadArray:(NSArray *)array {
    
    if (!baseArray) {
        baseArray = [[NSMutableArray alloc]init];
    }
    
    [baseArray removeAllObjects];
    [baseArray addObjectsFromArray:array];
    
    [myTableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return baseArray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * ident = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    TianQiPoint * point = [baseArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = point.city;
    
    return cell;
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
