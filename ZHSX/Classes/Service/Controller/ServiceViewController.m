//
//  ServiceViewController.m
//  ZHSX
//
//  Created by teacher on 16/12/27.
//  Copyright © 2016年 安徽商贸职业技术学院. All rights reserved.
//

#import "ServiceViewController.h"

@interface ServiceViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *serviceTableView;

@property(nonatomic, strong) NSArray *titles;

@end

@implementation ServiceViewController

-(NSArray *)titles{
    
    if (_titles == nil) {
        
        _titles = @[@"4s店", @"加油站", @"汽配店", @"维修站", @"保险公司", @"洗车店"];
    }
    
   

    return _titles;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.serviceTableView.dataSource = self;
    
    
    self.serviceTableView.rowHeight = 50;
    
    if (iPhone5_5S_SE) {
        
        self.serviceTableView.rowHeight = self.serviceTableView.rowHeight*1.15;
    }
    else if(iPhone6_6s_7){
        self.serviceTableView.rowHeight = self.serviceTableView.rowHeight*1.35;
    }
    
    else if (iPhone6Plus_6sPlus_7Plus) {
        self.serviceTableView.rowHeight = self.serviceTableView.rowHeight*1.55;
    }
    
    self.serviceTableView.tableFooterView = [[UIView alloc]init];
    
}


#pragma mark - 动态判断机型修改字体大小
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
 
    return 1;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titles.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *identifier = @"serviceCell";

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    NSString *title = [self.titles objectAtIndex:indexPath.row];
    
    
    
    if (iPhone4_4S) {
        
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:cell.textLabel.font.pointSize];
    }
    
    if (iPhone5_5S_SE) {
        
        cell.textLabel.font = [UIFont systemFontOfSize:16 * 1.15];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:cell.textLabel.font.pointSize];
    }
    else if(iPhone6_6s_7){
        cell.textLabel.font = [UIFont systemFontOfSize:16 *1.35];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:cell.textLabel.font.pointSize];
    }
    
    else if (iPhone6Plus_6sPlus_7Plus) {
        cell.textLabel.font = [UIFont systemFontOfSize:16 * 1.55];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:cell.textLabel.font.pointSize];
        
    }
    
    cell.textLabel.text = title;
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"查看附近的%@", title];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}

@end
