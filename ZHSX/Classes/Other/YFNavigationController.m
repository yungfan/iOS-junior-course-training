//
//  YFNavigationController.m
//  ZHSX
//
//  Created by teacher on 16/12/26.
//  Copyright © 2016年 安徽商贸职业技术学院. All rights reserved.
//

#import "YFNavigationController.h"

@implementation YFNavigationController



-(UINavigationController *)initWithRootViewController:(UIViewController *)vc andTitle:(NSString *)title andImage:(NSString *)imgName{
    
    self = [super initWithRootViewController:vc];
    
    if (self) {
        
        self.tabBarItem.title = title;
        vc.title = title;
        self.tabBarItem.image = [UIImage imageNamed:imgName];
        
    }
    
    return self;
    
}

//导航控制器里面
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        
        viewController.navigationItem.leftBarButtonItem=[YFNavigationController itemWithTarget:self action:@selector(back) image:@"navigationButtonReturn"];
    }
    
    [super pushViewController:viewController animated:YES];
    
}

+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image {
    UIButton *btn=[[UIButton alloc]init];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    CGSize size=btn.currentBackgroundImage.size;
    btn.frame=CGRectMake(0, 0, size.width, size.height);
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

-(void)back{
    [self popViewControllerAnimated:YES];
}

@end
