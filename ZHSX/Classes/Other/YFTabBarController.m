//
//  YFTabBarController.m
//  ZHSX
//
//  Created by teacher on 16/12/26.
//  Copyright © 2016年 安徽商贸职业技术学院. All rights reserved.
//

#import "YFTabBarController.h"
#import "YFNavigationController.h"
#import "HomeViewController.h"
#import "ServiceViewController.h"
#import "MallViewController.h"

@implementation YFTabBarController


-(instancetype)init{
   
    if (self = [super init]) {
        
        [self setUpControllers];
        
    }


    return self;
}

-(void)setUpControllers{

    //首页
    HomeViewController *homevc = [[HomeViewController alloc]init];
    
    //服务
    ServiceViewController *servicevc = [[ServiceViewController alloc]init];
    
    
    //商城
    MallViewController *mallvc = [[MallViewController alloc]init];
    
    
    
    //账本
    UIViewController *accountvc = [[UIStoryboard storyboardWithName:@"AccountStoryboard" bundle:nil] instantiateInitialViewController];
    
    
    YFNavigationController *home = [[YFNavigationController alloc]initWithRootViewController:homevc andTitle:@"首页" andImage:@"home"];
    
    YFNavigationController *service = [[YFNavigationController alloc]initWithRootViewController:servicevc andTitle:@"服务" andImage:@"service"];
    
    YFNavigationController *mall = [[YFNavigationController alloc]initWithRootViewController:mallvc andTitle:@"商城" andImage:@"mall"];
    
    YFNavigationController *account = [[YFNavigationController alloc]initWithRootViewController:accountvc andTitle:@"账本" andImage:@"account"];
    
    self.viewControllers  = @[home,service,mall,account];

}

@end
