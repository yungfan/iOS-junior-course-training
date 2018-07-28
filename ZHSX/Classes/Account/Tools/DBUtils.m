//
//  DBUtils.m
//  封装数据库的操作
//
//  Created by teacher on 16/12/28.
//  Copyright © 2016年 安徽商贸职业技术学院. All rights reserved.
//

#import "DBUtils.h"
#import "FMDB.h"


@implementation DBUtils

#pragma mark - 打开数据库
+(FMDatabase *)createDataBase{
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *dbPath = [path stringByAppendingPathComponent:@"carBook.sqlite"];
    
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    
    [db open];
    
    return db;
    
}

#pragma mark - 创建表
+(void)createTable{
    
    FMDatabase *db = [self createDataBase];
    
    NSString * sql = @"create table if not exists t_carBook(id integer primary key autoincrement, bz text, fkfs text, gls text, xfje text, xmmc text, xfrq text)";
    
    [db executeUpdate:sql];
    
    [db close];
}

@end
