//
//  AddAndUpdateViewController.h
//  ZHSX
//
//  Created by teacher on 16/12/29.
//  Copyright © 2016年 安徽商贸职业技术学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarBook.h"

@interface AddAndUpdateViewController : UIViewController

//接收上个界面传过来的Model对象  而且这个属性是判断添加还是修改的关键
@property(nonatomic, strong) CarBook *carBook;

@end
