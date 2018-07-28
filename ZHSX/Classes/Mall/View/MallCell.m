//
//  MallCell.m
//  ZHSX
//
//  Created by teacher on 16/12/27.
//  Copyright © 2016年 安徽商贸职业技术学院. All rights reserved.
//

#import "MallCell.h"

@implementation MallCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    if (iPhone5_5S_SE) {
        
        self.name.font = [UIFont systemFontOfSize:18*1.15];
        self.intro.font = [UIFont systemFontOfSize:17*1.15];
        self.price.font = [UIFont systemFontOfSize:16*1.15];
      
    }
    else if(iPhone6_6s_7){
        self.name.font = [UIFont systemFontOfSize:18*1.35];
        self.intro.font = [UIFont systemFontOfSize:17*1.35];
        self.price.font = [UIFont systemFontOfSize:16*1.35];
        
    }
    
    else if (iPhone6Plus_6sPlus_7Plus) {
        self.name.font = [UIFont systemFontOfSize:18*1.55];
        self.intro.font = [UIFont systemFontOfSize:17*1.55];
        self.price.font = [UIFont systemFontOfSize:16*1.55];
        
    }

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setMall:(MallModel *)mall{


    NSString *imgName = mall.imgName;
    
    //填充数据
    self.img.image = [UIImage imageNamed:imgName];
    self.name.text = mall.name;
    self.intro.text = mall.intro;
    self.price.text = mall.price;


}

@end
