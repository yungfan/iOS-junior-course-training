//
//  MallViewController.m
//  ZHSX
//
//  Created by teacher on 16/12/27.
//  Copyright © 2016年 安徽商贸职业技术学院. All rights reserved.
//

#import "MallViewController.h"
#import "MallCell.h"
#import "MallModel.h"
#import "SDCycleScrollView.h"



static NSString *identifier = @"mallCell";

@interface MallViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mallTableView;

@property(nonatomic, strong) NSArray *contents;


@end

@implementation MallViewController

#pragma mark - 懒加载内容
-(NSArray *)contents{
    
    if (_contents == nil) {
        
        MallModel *one = [[MallModel alloc]initWithImgName:@"jiyou" andName:@"机油" andIntro:@"机油是保证汽车运转的重要材料，它的品质非常重要" andPrice:@"300元"];
        MallModel *two = [[MallModel alloc]initWithImgName:@"luntai" andName:@"轮胎" andIntro:@"轮胎是汽车日行千里的保证，好的轮胎能够减小胎噪" andPrice:@"500元"];
        MallModel *three = [[MallModel alloc]initWithImgName:@"zuoyi" andName:@"安全座椅" andIntro:@"安全座椅是有儿童时的必备之物，能够保证儿童的安全" andPrice:@"1000元"];
        MallModel *four = [[MallModel alloc]initWithImgName:@"chedeng" andName:@"汽车大灯" andIntro:@"汽车大灯保证您回家的路上看清一切，是回家路上的好伴侣" andPrice:@"100元"];
        
        _contents = @[one, two, three, four];
    }
    
    
    
    return _contents;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
 
    //设置轮播
    [self setupBanner];
    
    self.mallTableView.dataSource = self;
    
    //关联TableView与Xib定义的cell
    [self.mallTableView registerNib:[UINib nibWithNibName:@"MallCell" bundle:nil] forCellReuseIdentifier:identifier];
    
    
    //根据自动布局计算高度
    self.mallTableView.estimatedRowHeight = 130.0;
    self.mallTableView.rowHeight = UITableViewAutomaticDimension;
}


#pragma mark - 设置轮播起
-(void)setupBanner{
    
    SDCycleScrollView *banner = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 0.32) imageNamesGroup:@[@"img_01.jpg", @"img_02.jpg", @"img_03.jpg", @"img_04.jpg", @"img_05.jpg"]];
    

    self.mallTableView.tableHeaderView = banner;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.contents.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
    //1、取出模型
    MallCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    MallModel *mall = [self.contents objectAtIndex:indexPath.row];
   
    //2、传模型
    cell.mall = mall;
    
    return cell;
}


@end
