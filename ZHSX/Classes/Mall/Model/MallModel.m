//
//  MallModel.m
//  ZHSX
//
//  Created by teacher on 16/12/27.
//  Copyright © 2016年 安徽商贸职业技术学院. All rights reserved.
//

#import "MallModel.h"

@implementation MallModel

-(instancetype)initWithImgName:(NSString *)imgName andName:(NSString *)name andIntro:(NSString *)intro andPrice:(NSString *)price{
    
    self = [super init];
    
    if (self != nil) {
        
        self.imgName = imgName;
        self.name = name;
        self.intro = intro;
        self.price = price;
        
    }
    return self;

}

@end
