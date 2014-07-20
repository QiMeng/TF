//
//  HaiQuViewController.m
//  Typhoon
//
//  Created by strongsoft on 14-7-16.
//  Copyright (c) 2014年 ;. All rights reserved.
//

#import "HaiQuViewController.h"
#import "HaiQuType.h"
@interface HaiQuViewController () <UITableViewDataSource,UITableViewDelegate>

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
- (void)loadView {
    [super loadView];
    baseArray = [[NSMutableArray alloc]init];
    {
        NSMutableArray * pArray = [NSMutableArray array];
        for (NSString * str in @[@"沿岸",@"近海",@"远海"] ) {
            [pArray addObject:[HaiQuType itemFormStr:str]];
        }
        [baseArray addObject:pArray];
    }
    {
        NSMutableArray * pArray = [NSMutableArray array];
        for (NSString * str in @[@"24小时",@"48小时",@"72小时"] ) {
            [pArray addObject:[HaiQuType itemFormStr:str]];
        }
        [baseArray addObject:pArray];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
    
}

#pragma mark - 初始化
- (void)initUI {
    
    myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    myTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.backgroundView = nil;
    myTableView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:myTableView];
    
}

#pragma mark UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return baseArray.count;
    
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    
//    HaiQuType * data = [baseArray objectAtIndex:section];
//    
//    if ([data isKindOfClass:[HaiQuType class]]) {
//        
//        return data.title;
//        
//    }
//    return @"";
//    
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSArray * data = [baseArray objectAtIndex:section];
    
    
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static    NSString* identifier = @"BaseCell";
    UITableViewCell* cell  = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSArray * data = [baseArray objectAtIndex:indexPath.section];
    
    HaiQuType * type = [data objectAtIndex:indexPath.row];
    
    cell.textLabel.text = type.title;
    
    if (type.isSelect) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    

    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSArray * data = [baseArray objectAtIndex:indexPath.section];

    HaiQuType * type = [data objectAtIndex:indexPath.row];
    type.isSelect = !type.isSelect;
    
//    if ([data isKindOfClass:[YunTuItem class]]) {
//        
//        for (YunTuItem * item in ((YunTuItem *)data).items) {
//            item.isSelect = NO;
//        }
//        
//        YunTuItem * subItem = [((YunTuItem *)data).items objectAtIndex:indexPath.row];
//        subItem.isSelect = YES;
//        
//    }
    
    
    [myTableView reloadData];
    
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
