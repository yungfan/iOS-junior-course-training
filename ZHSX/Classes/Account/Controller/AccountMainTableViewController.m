//
//  AccountMainTableViewController.m
//  ZHSX
//
//  Created by teacher on 16/12/28.
//  Copyright © 2016年 安徽商贸职业技术学院. All rights reserved.
//

#import "AccountMainTableViewController.h"
#import "AddAndUpdateViewController.h"
#import "AccountTableViewCell.h"
#import "CarBookDAO.h"
#import "DBUtils.h"
#import "MJRefresh.h"
#import "UIScrollView+EmptyDataSet.h"


static NSString *cellID = @"aacountcell";

@interface AccountMainTableViewController () <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property(nonatomic, strong) CarBookDAO *carBookDAO;

@property(nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation AccountMainTableViewController


#pragma mark - 懒加载数据源数据（从数据库查询）
-(NSMutableArray *)dataSource{

    if (_dataSource == nil) {
        
        _dataSource = [self.carBookDAO queryAll];
    }
    return _dataSource;


}

#pragma mark - 懒加载DAO
-(CarBookDAO *)carBookDAO{

    if (_carBookDAO == nil) {
        
        _carBookDAO = [[CarBookDAO alloc]init];
    }
    return _carBookDAO;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建一个添加UIBarButtonItem 用于跳转到添加界面
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pushVC)];
    
    self.navigationItem.rightBarButtonItem = addItem;
    
    //添加下拉刷新
    [self mjRefresh];

}


#pragma mark - 设置空数据时的数据源和代理对象
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
     self.tableView.emptyDataSetSource = self;
     self.tableView.emptyDataSetDelegate = self;
     self.tableView.tableFooterView = [[UIView alloc]init];
    
}

#pragma mark - 无数据时提示
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"暂无数据，点击右上角+添加数据";
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    UIFont * font = [UIFont systemFontOfSize:15.0f];
    
    if (iPhone5_5S_SE) {
        
        font = [UIFont systemFontOfSize:font.pointSize *1.15];
    }
    else if(iPhone6_6s_7) {
        font = [UIFont systemFontOfSize:font.pointSize*1.35];
        
    }
    
    else if (iPhone6Plus_6sPlus_7Plus) {
        font = [UIFont systemFontOfSize:font.pointSize*1.55];
    }

    
    NSDictionary *attributes = @{NSFontAttributeName: font,
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}


#pragma mark - 允许下拉操作 可以做下拉刷新
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

#pragma mark - 添加下拉刷新效果
-(void)mjRefresh{
    
    NSArray *imgs = @[[UIImage imageNamed:@"icon_listheader_animation_1"], [UIImage imageNamed:@"icon_listheader_animation_2"], [UIImage imageNamed:@"icon_listheader_animation_3"], [UIImage imageNamed:@"icon_listheader_animation_4"]];
  
   
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [header setImages:imgs forState:MJRefreshStateIdle];
    [header setImages:imgs forState:MJRefreshStatePulling];
    [header setImages:imgs forState:MJRefreshStateRefreshing];

    self.tableView.mj_header = header;


}

#pragma mark - 下拉刷新执行的逻辑
-(void)loadNewData{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.dataSource = [self.carBookDAO queryAll];
        
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
    });
}


#pragma mark - 跳转到添加修改界面
-(void)pushVC{

    AddAndUpdateViewController *addAndUpdateVC = [[UIStoryboard storyboardWithName:@"AccountStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"addAndUpdate"];
    
    [self.navigationController pushViewController:addAndUpdateVC animated:YES];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //1、取模型数据
    CarBook *carBook = [self.dataSource objectAtIndex:indexPath.row];
    
    //2、填充模型
    AccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.carBook = carBook;
   
    
    return cell;
}



#pragma mark - 告诉TableView cell可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
   
    return YES;
}



#pragma mark - 哪一种编辑
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewCellEditingStyleDelete;

}


#pragma mark - 滑动删除时 删除action的提示文字
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{

   return @"删除";

}

#pragma mark - 点击删除按钮的时候回调函数
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
  
        //表象
        CarBook *book = [self.dataSource objectAtIndex:indexPath.row];
        
        [self.dataSource removeObject:book];
        
        [self.tableView reloadData];
        
        //实质（真的从数据库中删除数据）
    
        [self.carBookDAO deleteCarBook:book.bookId];
    
    }
}

#pragma mark - 点击Cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    CarBook *book = [self.dataSource objectAtIndex:indexPath.row];
    
    AddAndUpdateViewController *addAndUpdateVC = [[UIStoryboard storyboardWithName:@"AccountStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"addAndUpdate"];
    
    //将cell对应的模型传给下一个界面
    addAndUpdateVC.carBook = book;
    
    [self.navigationController pushViewController:addAndUpdateVC animated:YES];
 

}


@end
