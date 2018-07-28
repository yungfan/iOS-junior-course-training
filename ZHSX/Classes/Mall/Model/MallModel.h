//
//  MallModel.h
//  ZHSX
//
//  Created by teacher on 16/12/27.
//  Copyright © 2016年 安徽商贸职业技术学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MallModel : NSObject


//1、拷贝cell里面的属性
//2、修改上面的东西（1）去除IBOutlet （2）将weak改成strong、assign、copy  （3）根据属性的类型最终要显示的"东西"来修改后面的类型

@property (copy, nonatomic) NSString * imgName;
@property (copy, nonatomic) NSString * name;
@property (copy, nonatomic) NSString * intro;
@property (copy, nonatomic) NSString * price;


-(instancetype)initWithImgName:(NSString*)imgName andName:(NSString *)name andIntro:(NSString *)intro andPrice:(NSString *)price;

@end
