//
//  MallCell.h
//  ZHSX
//
//  Created by teacher on 16/12/27.
//  Copyright © 2016年 安徽商贸职业技术学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MallModel.h"

@interface MallCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *intro;
@property (weak, nonatomic) IBOutlet UILabel *price;

@property(nonatomic, strong) MallModel *mall;

@end
