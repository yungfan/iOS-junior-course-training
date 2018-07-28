//
//  HomeViewController.m
//  ZHSX
//
//  Created by teacher on 16/12/26.
//  Copyright © 2016年 安徽商贸职业技术学院. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cx;
@property (weak, nonatomic) IBOutlet UILabel *gmrq;
@property (weak, nonatomic) IBOutlet UILabel *cp;
@property (weak, nonatomic) IBOutlet UILabel *jg;
@property (weak, nonatomic) IBOutlet UILabel *ys;

@end

@implementation HomeViewController

-(void)viewDidLoad{

    [super viewDidLoad];
    
    [self setCarInfo];
    
  
}


#pragma mark - 解析JSON数据获取信息
-(void)setCarInfo{

    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"carInfo.json" ofType:nil];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    self.cx.text = result[@"data"][@"cx"];
    self.gmrq.font = result[@"data"][@"gmrq"];
    self.cp.font = result[@"data"][@"cp"];
    self.jg.font = result[@"data"][@"jg"];
    self.ys.font = result[@"data"][@"ys"];
    
}

#pragma mark - 动态判断机型修改字体大小
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    if (iPhone4_4S) {
        
        self.cx.font =  [UIFont systemFontOfSize: 16];
        self.gmrq.font = [UIFont systemFontOfSize: self.cx.font.pointSize];
        self.cp.font = [UIFont systemFontOfSize: self.cx.font.pointSize];
        self.jg.font = [UIFont systemFontOfSize:self.cx.font.pointSize];
        self.ys.font = [UIFont systemFontOfSize:self.cx.font.pointSize];

    }
    
    else if (iPhone5_5S_SE) {
        
        self.cx.font =  [UIFont systemFontOfSize: 16 * 1.15];
        self.gmrq.font = [UIFont systemFontOfSize: self.cx.font.pointSize];
        self.cp.font = [UIFont systemFontOfSize: self.cx.font.pointSize];
        self.jg.font = [UIFont systemFontOfSize:self.cx.font.pointSize];
        self.ys.font = [UIFont systemFontOfSize:self.cx.font.pointSize];
    }
    else if(iPhone6_6s_7){
        self.cx.font = [UIFont systemFontOfSize: 16*1.35];
        self.gmrq.font = [UIFont systemFontOfSize: self.cx.font.pointSize];
        self.cp.font = [UIFont systemFontOfSize: self.cx.font.pointSize];
        self.jg.font = [UIFont systemFontOfSize: self.cx.font.pointSize];
        self.ys.font = [UIFont systemFontOfSize: self.cx.font.pointSize];
        
    }
    
    else if (iPhone6Plus_6sPlus_7Plus) {
        self.cx.font = [UIFont systemFontOfSize:16*1.55];
        self.gmrq.font = [UIFont systemFontOfSize:self.cx.font.pointSize];
        self.cp.font = [UIFont systemFontOfSize:self.cx.font.pointSize];
        self.jg.font = [UIFont systemFontOfSize:self.cx.font.pointSize];
        self.ys.font = [UIFont systemFontOfSize:self.cx.font.pointSize];
        
    }
    
}

@end
