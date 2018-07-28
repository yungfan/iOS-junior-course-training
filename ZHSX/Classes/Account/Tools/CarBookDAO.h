//
//  CarBookDAO.h
//  封装数据库的操作
//
//  Created by teacher on 16/12/28.
//  Copyright © 2016年 安徽商贸职业技术学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarBook.h"


//实现数据库真正的增删改查操作
@interface CarBookDAO : NSObject

-(void)addCarBook:(CarBook *)carBook;

-(void)updateCarBook:(CarBook *)carBook;

-(void)deleteCarBook:(int)carBookId;

-(CarBook *)queryCarBook:(id)carBookId;

-(NSMutableArray *)queryAll;

@end
