//
//  ActivityManager.h
//  Vodka
//
//  Created by jinyu on 15/7/16.
//  Copyright (c) 2015年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "DefineFragments.h"
@interface ActivityManager : NSObject

@property(nonatomic, assign)BOOL    isUpdate;

instance_interface(ActivityManager, defaultManager)

/**
 *  @brief 查询一条骑行记录是否已在本地存在
 *
 *  @param identifier 骑行记录的 sport_identifer
 *  @param database   数据库实例
 *
 *  @return  YES:记录已存在，NO:记录不存在
 */
+ (BOOL)existCyclingRecordWithActivityIdentify:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief  判断当前用户是否有未完成的骑行记录
 *
 *  @param  database 数据库实例
 *
 *  @return YES:有未完成的记录, NO:没有未完成的记录
 */
+ (BOOL)existUnFinihsedCyclingRecordInDatabase:(FMDatabase*)database;

/**
 *  @brief  更新数组数据表
 *
 *  @param  activity 骑行记录identify
 *  @param  database 数据库实例
 */
//+ (void)updateCyclingArrays:(ActivityModel*)activity database:(FMDatabase*)database;

/**
 *  @brief 将一条骑行记录存入本地数据库
 *
 *  @param activity 骑行记录的实例
 *  @param database 数据库实例
 */
//+ (void)insertCyclingRecord:(ActivityModel*)activity database:(FMDatabase*)database needArray:(BOOL)needinsertArray;

/**
 *  @brief  从数据库中删除一条骑行记录
 *
 *  @param  identifier 骑行记录identifier
 *  @param  database   数据库实例
 */
+ (void)deleteCyclingRecord:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief 查询所有没有下载完 samples 的骑行记录(对应数据库中还没有开始下载samples的记录, cycling_record_samples_status = kDefaultState)
 *
 *  @param database 数据库实例
 *
 *  @return 未下载的骑行记录的集合。
 */
+ (NSArray*)getUnDownloadCyclingRecordInDatabase:(FMDatabase*)database;

/**
 *  @brief 查询一条骑行记录的打点信息下载状态
 *
 *  @param identifer 骑行记录identifier
 *  @param database  数据库实例
 
 *  @see    CyclingRecordSamplesStatus
 
 *  @return 打点信息下载状态
 */
//+ (CyclingRecordSamplesStatus)getCyclingRecordSamplesDownloadStateWithRecordIdentifier:(NSString*)identifer database:(FMDatabase*)database;

/**
 *  @brief 获取本地的已经完成并且未上传的骑行记录
 *
 *  @param database 数据库实例
 *
 *  @return 本地完成并未上传的骑行记录
 */
+ (NSArray*)getLocalFinishedCyclingRecordsInDatabase:(FMDatabase*)database;

/**
 *  @brief  查询当前登陆的用户未完成的骑行记录
 *
 *  @param  datase 数据库实例
 *
 *  @return 未完成的骑行记录实例
 */
//+ (ActivityModel*)getUnFinishedCyclingRecordInDatabase:(FMDatabase*)database;

/**
 *  @brief 查询最后一条骑行记录
 *
 *  @param database 数据库实例
 *
 *  @return 最后一条骑行记录
 */
//+ (ActivityModel*)getLastRecordInDatabase:(FMDatabase*)database;

/**
 *  @brief  获取所有已经完成的骑行记录
 *
 *  @param  datase 数据库实例
 *
 *  @return 所有已完成的骑行记录
 */
+ (NSArray*)getAllFinishedCyclingRecordsInDatabase:(FMDatabase*)database;

/**
 *  @brief  根据骑行记录的identifier获取完整的骑行记录
 *
 *  @param  identifier 骑行记录identifer
 *  @param  database   s数据库实例
 *
 *  @return 完整的骑行记录
 */
//+ (ActivityModel*)getCyclingRecordWithActivityIdentifier:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief 更新骑行记录中打点的下载状态
 *
 *  @param state      打点下载状态
 *  @param identifier 骑行记录 sport identifier
 *  @see   CyclingRecordSamplesStatus
 *  @param database   数据库实例
 */
//+ (void)updateSampleState:(CyclingRecordSamplesStatus)state identifier:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief 更新数据点的上传状态
 *
 *  @param uploaded   打点上传状态
 *  @param identifier 骑行记录id
 *  @param database   数据库实例
 */
+ (void)updateSamplesUploadState:(BOOL)uploaded identifier:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief 更新骑行记录的上传状态
 *
 *  @param isSynced YES:已上传，NO:未上传
 *  @param database 数据库实例
 */
+ (void)updateCyclingRecordSyncStatus:(BOOL)isSynced identifier:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief 更新是否为作弊数据的字段
 *
 *  @param isFake     YES:作弊数据
 *  @param identifier sport identifier
 *  @param database   数据库实例
 */
+ (void)updateIsFake:(BOOL)isFake identifier:(NSString*)identifier database:(FMDatabase*)database;
    
/**
 *  @brief 更新骑行记录对应的服务器数据表的 id
 *
 *  @param activityId 服务器数据表
 *  @param identifier sport identifier
 *  @param database   数据库实例
 */
+ (void)updateActivityId:(NSString*)activityId identifier:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief  更新骑行记录骑行是否结束的状态
 *
 *  @param  finished   YES:骑行结束, NO:骑行未结束
 *  @param  identifier 骑行记录identfier
 *  @param  database   数据库实例
 */
+ (void)updateCyclingFinisheState:(BOOL)finished identifier:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief  更新骑行记录结束时间
 *
 *  @param  stopDate   结束时间
 *  @param  identifier 骑行记录identifer
 *  @param  database   数据库实例
 */
+ (void)updateCyclingStopDate:(NSDate*)stopDate identifier:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief  更行骑行记录的最大速度
 *
 *  @param  speed_max  最大速度值（km/h）
 *  @param  identifier 骑行记录identifier
 *  @param  database   数据库实例
 */
//+ (void)updateCyclingRecordMaxSpeed:(CGFloat)speed_max identifier:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief  更新骑行记录的平均速度
 *
 *  @param  speed_avg  平均速度值(km/h)
 *  @param  identifier 骑行记录的identifier
 *  @param  database   数据库实例
 */
//+ (void)updateCyclingRecordAvageSpeed:(CGFloat)speed_avg identifier:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief  更新骑行记录的累计海拔升高
 *
 *  @param  totalRise  累计海拔升高（m）
 *  @param  identifier 骑行记录的identifier
 *  @param  database   数据库实例
 */
//+ (void)updateCyclingRecordTotalRise:(CGFloat)totalRise identifier:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief  更新骑行记录的累计爬坡距离
 *
 *  @param  rotalUphill 累计爬坡距离（m）
 *  @param  identifier  骑行记录的identifier
 *  @param  database    数据库实例
 */
//+ (void)updateCyclingRecordTotalUphill:(CGFloat)totalUphill identifier:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief  更新骑行记录的总时间
 *
 *  @param  totalTime  总时间（s）
 *  @param  identifier 骑行记录的totalTime
 *  @param  database   数据库实例
 */
//+ (void)updateCyclingTotalTime:(CGFloat)totalTime identifier:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief  更新骑行记录总里程
 *
 *  @param  distance   总里程（km）
 *  @param  identifier 骑行记录identifier
 *  @param  database   数据库实例
 */
//+ (void)updateCyclingRecordDistanceTotal:(CGFloat)distance identifier:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief  更新骑行记录总消耗卡路里
 *
 *  @param  distance   总消耗卡路里（kC）
 *  @param  identifier 骑行记录identifier
 *  @param  database   数据库实例
 */
//+ (void)updateCyclingRecordCalories:(CGFloat)calories identifier:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief  更新骑行记录的标题
 *
 *  @param  title      骑行记录标题
 *  @param  identifier 骑行记录identifier
 *  @param  database   数据库实例
 */
+ (void)updateCyclingRecordTitle:(NSString*)title identifier:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief  更新骑行记录缩略图
 *
 *  @param  imageRelativePath 骑行记录缩略图的相对路径
 *  @param  identifier        骑行记录identifier
 *  @param  database          数据库实例
 */
+ (void)updateCYclingRecordThumbImage:(NSString*)imageRelativePath identifier:(NSString*)identifier database:(FMDatabase*)database;

/**
 *  @brief  上传骑行记录的缩略图
 *
 *  @param  activity 骑行记录实例
 */
//+ (void)uploadCyclingThumbImageWithActivity:(ActivityModel*)activity;

@end
