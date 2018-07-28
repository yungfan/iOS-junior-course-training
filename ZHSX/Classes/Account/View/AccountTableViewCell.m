//
//  AccountTableViewCell.m
//  ZHSX
//
//  Created by teacher on 16/12/29.
//  Copyright © 2016年 安徽商贸职业技术学院. All rights reserved.
//

#import "AccountTableViewCell.h"

@implementation AccountTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    if (iPhone5_5S_SE) {
        
        self.xfrq.font = [UIFont systemFontOfSize:16*1.15];
        self.xmmc.font = [UIFont systemFontOfSize:self.xfrq.font.pointSize];
        self.xfje.font = [UIFont systemFontOfSize:self.xfrq.font.pointSize];
        
    }
    else if(iPhone6_6s_7){
        self.xfrq.font = [UIFont systemFontOfSize:16*1.35];
        self.xmmc.font = [UIFont systemFontOfSize:self.xfrq.font.pointSize];
        self.xfje.font = [UIFont systemFontOfSize:self.xfrq.font.pointSize];
        
    }
    
    else if (iPhone6Plus_6sPlus_7Plus) {
        self.xfrq.font = [UIFont systemFontOfSize:16*1.55];
        self.xmmc.font = [UIFont systemFontOfSize:self.xfrq.font.pointSize];
        self.xfje.font = [UIFont systemFontOfSize:self.xfrq.font.pointSize];
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCarBook:(CarBook *)carBook{

    self.xfrq.text = carBook.xfrq;
    
    self.xmmc.text = carBook.xmmc;
    
    self.xfje.text = [NSString stringWithFormat:@"%@元",carBook.xfje];

}

@end
