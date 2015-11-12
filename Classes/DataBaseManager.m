//
//  LPDBManager.m
//  LepaoBeads
//
//  Created by Tianyu on 15/3/11.
//  Copyright (c) 2015年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

#import "DataBaseManager.h"
#define DBFileName_Key   @"BeastBikes.db"
@implementation DataBaseManager

instance_implementation(DataBaseManager, defaultManager)

/**
 *  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
 [DataBaseManager syschronizeDBFile];
 */
#pragma mark - 同步数据库文件。启动应用的时候放在子线程里面执行下。第一次安装新建DB。
+ (void)syschronizeDBFile
{
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    
    NSString* document = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSString * dbFile = [document stringByAppendingPathComponent:DBFileName_Key];
    if (![fileManager fileExistsAtPath:dbFile]) {
        
        NSString *initDBFile = [[NSBundle mainBundle] pathForResource:@"BeastBikes" ofType:@"db"];
        BOOL success = [fileManager copyItemAtPath:initDBFile toPath:dbFile error:nil];
        
        if (!success)
        {
            NSLog(@"ERROR ON COPYING DB FILE: %@ -> %@",initDBFile, dbFile);
        }else{
            NSLog(@"创建LepaoBeads.db数据库成功");
        }
    }else{
        NSLog(@"数据库已经存在");
    }
}

- (id)init{
    if(self = [super init]){
        self.database = [FMDatabase databaseWithPath:[DataBaseManager dbFilePath]];
        self.databaseQueue = [FMDatabaseQueue databaseQueueWithPath:[DataBaseManager dbFilePath]];
        self.databaseSyncQueue = dispatch_queue_create("com.zmw.database.queue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

+ (dispatch_queue_t)syncDatabaseQueue{
    return [[DataBaseManager defaultManager] databaseSyncQueue];
}

#pragma mark - 数据库文件路径
+ (NSString *)dbFilePath
{
    NSString * dbFile = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:DBFileName_Key];
    if ([[NSFileManager defaultManager] fileExistsAtPath:dbFile]) {
        return dbFile;
    }
    return nil;;
}

//- (FMDatabase*)database{
//    self.database = [FMDatabase databaseWithPath:[DataBaseManager dbFilePath]];
//    [_database open];
//    
//    
//    return _database;
//}
//
//- (FMDatabaseQueue*)databaseQueue{
//    _databaseQueue = [FMDatabaseQueue databaseQueueWithPath:[DataBaseManager dbFilePath]];
//    return _databaseQueue;
//}

@end

