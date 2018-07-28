//
//  CarBookDAO.m
//  封装数据库的操作
//
//  Created by teacher on 16/12/28.
//  Copyright © 2016年 安徽商贸职业技术学院. All rights reserved.
//

#import "CarBookDAO.h"
#import "DBUtils.h"
#import "FMDB.h"

@interface CarBookDAO()

@property(nonatomic, strong) FMDatabase *db;

@end

@implementation CarBookDAO


#pragma mark - 懒加载数据库
-(FMDatabase *)db{
    
    if (_db == nil) {
        
        _db = [DBUtils createDataBase];
    }
    
    return _db;

}


#pragma mark - 增加记录
-(void)addCarBook:(CarBook *)carBook{
    
    [self.db open];
    
    NSString *sql = @"insert into t_carbook(bz, fkfs, gls, xfje, xmmc, xfrq) values(?, ?, ?, ?, ?, ?)";
    
    [self.db executeUpdate:sql, carBook.bz, carBook.fkfs, carBook.gls, carBook.xfje, carBook.xmmc, carBook.xfrq];
    
    [self.db close];
    
}

//id我们并没有创建并保存，而是数据库自增长的一个字段，现在需要用它，必须去数据库中查找

#pragma mark - 更新记录
-(void)updateCarBook:(CarBook *)carBook{
    
    [self.db open];
    
    NSString *sql = @"update t_carbook set bz = ?, fkfs = ?, gls = ?, xfje = ?, xmmc = ?, xfrq = ? where id = ?";
    
    NSLog(@"%d", carBook.bookId);

    [self.db executeUpdate:sql, carBook.bz, carBook.fkfs, carBook.gls, carBook.xfje, carBook.xmmc, carBook.xfrq, @(carBook.bookId)];
    
    [self.db close];
    
    
}

#pragma mark - 删除记录
-(void)deleteCarBook:(int)carBookId{
    
    [self.db open];
    
    NSString *sql = @"delete from t_carbook where id = ?";
    
    [self.db executeUpdate:sql, @(carBookId)];

    [self.db close];
    
    
}


#pragma mark - 查询单个
-(CarBook *)queryCarBook:(id)carBookId{
    
    return nil;
    
}


#pragma mark - 查询所有
-(NSMutableArray *)queryAll{
    
    //记得要打开数据库，因为每次操作都关闭了数据库
    [self.db open];
    
    NSMutableArray *array = [NSMutableArray array];
    
    NSString *sql = @"select * from t_carbook order by id desc";
    
    FMResultSet *result = [self.db executeQuery:sql];
    
    while (result.next) {
        
        int carBookId = [result intForColumn:@"id"];
        NSString *bz = [result stringForColumn:@"bz"];
        NSString *fkfs = [result stringForColumn:@"fkfs"];
        NSString *gls = [result stringForColumn:@"gls"];
        NSString *xfje = [result stringForColumn:@"xfje"];
        NSString *xmmc = [result stringForColumn:@"xmmc"];
        NSString *xfrq = [result stringForColumn:@"xfrq"];
        
        CarBook *carBook = [[CarBook alloc]initWithBZ:bz andFkfs:fkfs andGls:gls andXfje:xfje andXmmc:xmmc andXfrq:xfrq];
        
        //一定要保存好从数据库查询出来的id
        carBook.bookId = carBookId;
        
        [array addObject:carBook];
        
    }
    
    [self.db close];
    
    return array;
}

@end
