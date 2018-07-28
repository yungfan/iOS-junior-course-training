//
//  AccountTableViewCell.h
//  ZHSX
//
//  Created by teacher on 16/12/29.
//  Copyright © 2016年 安徽商贸职业技术学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarBook.h"

@interface AccountTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *xfrq;
@property (weak, nonatomic) IBOutlet UILabel *xmmc;
@property (weak, nonatomic) IBOutlet UILabel *xfje;

@property(nonatomic, strong)CarBook *carBook;

@end
