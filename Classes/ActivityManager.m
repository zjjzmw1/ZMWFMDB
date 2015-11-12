//
//  ActivityManager.m
//  Vodka
//
//  Created by jinyu on 15/7/16.
//  Copyright (c) 2015年 Beijing Beast Technology Co.,Ltd. All rights reserved.
//

#import "ActivityManager.h"
//#import "DataBaseManager.h"
@implementation ActivityManager

//instance_implementation(ActivityManager, defaultManager)

//- (id)init{
//    if(self = [super init]){
//        
//    }
//    return self;
//}

#pragma mark - 判断一条记录是否存在
//
///**
// *  @brief 查询一条骑行记录是否已在本地存在
// *
// *  @param identifier 骑行记录的 sport_identifer
// *  @param database   数据库实例
// *
// *  @return  YES:记录已存在，NO:记录不存在
// */
//+ (BOOL)existCyclingRecordWithActivityIdentify:(NSString*)identifier database:(FMDatabase*)database{
//    FMResultSet* result = [database executeQuery:@"select * from cycling_record_table where user_id = ? and activity_identify = ?", @"1", identifier];
//    if([result next]){
//        return YES;
//    }
//    return NO;
//}
//
///**
// *  @brief  判断当前用户是否有未完成的骑行记录
// *
// *  @param  database 数据库实例
// *
// *  @return YES:有未完成的记录, NO:没有未完成的记录
// */
//+ (BOOL)existUnFinihsedCyclingRecordInDatabase:(FMDatabase*)database{
//    FMResultSet* result = [database executeQuery:@"select * from cycling_record_table where user_id = ? and isCyclingFinished = ?", @"1", @NO];
//    if([result next]){
//        return YES;
//    }
//    return NO;
//}
//
//#pragma mark - 数组temp表操作
//
///**
// *  @brief  更新数组数据表
// *
// *  @param  activity 骑行记录identify
// *  @param  database 数据库实例
// */
////+ (void)updateCyclingArrays:(ActivityModel*)activity database:(FMDatabase*)database{
//////    [database executeUpdate:@"update cycling_record_temp_arrays_table set relative_altitude_array_json = ?, pressure_array_json = ?, poly_location_array_json = ?, times_array_json = ?, speed_location_array_json = ?, hight_array_json = ?, distance_array_json = ? where activity_identify = ?", [activity.relativeAltitudeArray jsonstring], [activity.pressureArray jsonstring], [activity.polyLocationArray jsonstring], [activity.timesArray jsonstring], [activity.speedCLLocationArray jsonstring], [activity.highArray jsonstring], [activity.distanceArray jsonstring], activity.activityIdentify];
////}
//
//
//+ (void)deleteCyclingRecordArrays:(NSString*)identifier database:(FMDatabase*)database{
//    [database executeUpdate:@"delete from cycling_record_temp_arrays_table where activity_identify = ?", identifier];
//}
//
//+ (NSDictionary*)getArraysWithCyclingRecordIdentfier:(NSString*)identifier database:(FMDatabase*)database{
//    FMResultSet* result = [database executeQuery:@"select * from cycling_record_temp_arrays_table where activity_identify = ?", identifier];
//    if([result next]){
//        return [result resultDictionary];
//    }
//    return nil;
//}
//
//#pragma mark - 插入数据库
//
///**
// *  @brief 将一条骑行记录存入本地数据库
// *
// *  @param activity 骑行记录的实例
// *  @param database 数据库实例
// */
////+ (void)insertCyclingRecord:(ActivityModel*)activity database:(FMDatabase*)database needArray:(BOOL)needinsertArray{
////    
////    [database executeUpdate:@"insert into cycling_record_table(user_id, activity_id, activity_identify, start_date, stop_date, title, distance_total, calories_total, time_total, speed_average, speed_max, uphill_distance, is_fake, rise_total, note, is_synced, isCyclingFinished, cycling_image, baidu_map, cycling_record_samples_status, custom_image_path, samples_upload) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", activity.userId, activity.activityId, activity.activityIdentify, activity.startDate, activity.stopDate, activity.title, @(activity.distanceTotal), @(activity.caloriesTotal), @(activity.timeTotal), @(activity.speed), @(activity.speedMax), @(activity.uphillDistance), @(activity.isFake), @(activity.riseTotal), activity.note, @(activity.isSynced), @(activity.isCyclingFinished), activity.cyclingImage, @(activity.baiduMap), @(activity.samplesStatus), activity.customImagePath, @(activity.samples_upload)];
////    
//////    if(needinsertArray){
//////        [database executeUpdate:@"insert into cycling_record_temp_arrays_table(activity_identify, relative_altitude_array_json, pressure_array_json, poly_location_array_json, times_array_json, speed_location_array_json, hight_array_json, distance_array_json) values(?, ?, ?, ?, ?, ?, ?, ?)", activity.activityIdentify, [activity.relativeAltitudeArray jsonstring], [activity.pressureArray jsonstring], [activity.polyLocationArray jsonstring], [activity.timesArray jsonstring], [activity.speedCLLocationArray jsonstring], [activity.highArray jsonstring], [activity.distanceArray jsonstring]];
//////    }
////}
//
//#pragma mark - 删除记录
//
///**
// *  @brief  从数据库中删除一条骑行记录
// *
// *  @param  identifier 骑行记录identifier
// *  @param  database   数据库实例
// */
//+ (void)deleteCyclingRecord:(NSString*)identifier database:(FMDatabase*)database{
////    [database executeUpdate:@"delete from cycling_record_table where user_id = ? and activity_identify = ?", [[[UserManager ShareInstance] userModel] userid], identifier];
//}
//
//
//#pragma mark - 查询功能
//
///**
// *  @brief 查询所有没有下载完 samples 的骑行记录(对应数据库中还没有开始下载samples的记录, cycling_record_samples_status = kDefaultState)
// *
// *  @param database 数据库实例
// *
// *  @return 未下载的骑行记录的集合。
// */
////+ (NSArray*)getUnDownloadCyclingRecordInDatabase:(FMDatabase*)database{
////    
////    NSMutableArray* array = [[NSMutableArray alloc] init];
////    
//////    FMResultSet* result = [database executeQuery:@"select * from cycling_record_table where cycling_record_samples_status = ? and user_id = ?", @(kDefaultState), [[[UserManager ShareInstance] userModel] userid]];
//////    while ([result next]) {
//////        ActivityModel* model = [ActivityManager activityModelWithDictionary:[result resultDictionary]];
//////        [array addObject:model];
////    }
////    if(array.count > 0){
////        return array;
////    }
////    return nil;
////}
//
///**
// *  @brief 查询一条骑行记录的打点信息下载状态
// *
// *  @param identifer 骑行记录identifier
// *  @param database  数据库实例
// 
// *  @see    CyclingRecordSamplesStatus
// 
// *  @return 打点信息下载状态
// */
////+ (CyclingRecordSamplesStatus)getCyclingRecordSamplesDownloadStateWithRecordIdentifier:(NSString*)identifer database:(FMDatabase*)database{
////    FMResultSet* result = [database executeQuery:@"select * from cycling_record_table where user_id = ? and activity_identify = ?", [[[UserManager ShareInstance] userModel] userid], identifer];
////    if([result next]){
////        return (CyclingRecordSamplesStatus)[result intForColumn:@"cycling_record_samples_status"];
////    }
////    return 0;
////}
//
///**
// *  @brief 获取本地的已经完成并且未上传的骑行记录
// *
// *  @param database 数据库实例
// *
// *  @return 本地完成并未上传的骑行记录
// */
////+ (NSArray*)getLocalFinishedCyclingRecordsInDatabase:(FMDatabase*)database{
////    
////    NSMutableArray* array = [[NSMutableArray alloc] init];
////    FMResultSet* result = [database executeQuery:@"select * from cycling_record_table where user_id = ? and is_synced = ? and isCyclingFinished = ? and samples_upload = ?", [[[UserManager ShareInstance] userModel] userid], @NO, @YES, @YES];
////    while ([result next]) {
////        ActivityModel* s = [ActivityManager activityModelWithDictionary:[result resultDictionary]];
////        [array addObject:s];
////    }
////    if(array.count > 0){
////        return array;
////    }
////    return nil;
////}
//
///**
// *  @brief  查询当前登陆的用户未完成的骑行记录
// *
// *  @param  datase 数据库实例
// *
// *  @return 未完成的骑行记录实例
// */
////+ (ActivityModel*)getUnFinishedCyclingRecordInDatabase:(FMDatabase*)database{
////    FMResultSet* result = [database executeQuery:@"select * from cycling_record_table where user_id = ? and isCyclingFinished = ?", [[[UserManager ShareInstance] userModel] userid], @NO];
////    if([result next]){
////        
////        ActivityModel* activity = [ActivityManager activityModelWithDictionary:[result resultDictionary]];
////
////        return [ActivityManager appendingTempArray:[ActivityManager getArraysWithCyclingRecordIdentfier:activity.activityIdentify database:database] activity:activity];
////    }
////    return nil;
////}
//
///**
// *  @brief 查询最后一条骑行记录
// *
// *  @param database 数据库实例
// *
// *  @return 最后一条骑行记录
// */
////+ (ActivityModel*)getLastRecordInDatabase:(FMDatabase*)database{
////    FMResultSet* result = [database executeQuery:@"select * from cycling_record_table where user_id = ? order by start_date desc limit 1", [[[UserManager ShareInstance] userModel] userid]];
////    if([result next]){
////        ActivityModel* activity = [ActivityManager activityModelWithDictionary:[result resultDictionary]];
////        return [ActivityManager appendingTempArray:[ActivityManager getArraysWithCyclingRecordIdentfier:activity.activityIdentify database:database] activity:activity];
////    }
////    return nil;
////}
//
///**
// *  @brief  获取所有已经完成的骑行记录
// *
// *  @param  datase 数据库实例
// *
// *  @return 所有已完成的骑行记录
// */
////+ (NSArray*)getAllFinishedCyclingRecordsInDatabase:(FMDatabase*)database{
////    NSMutableArray* array = [[NSMutableArray alloc] init];
////    FMResultSet* result = [database executeQuery:@"select * from cycling_record_table where user_id = ? and isCyclingFinished = ? order by start_date desc", [[[UserManager ShareInstance] userModel] userid], @YES];
////    while ([result next]) {
////        ActivityModel* s = [ActivityManager activityModelWithDictionary:[result resultDictionary]];
////        [array addObject:s];
////    }
////    if(array.count > 0){
////        return array;
////    }
////    return nil;
////}
//
///**
// *  @brief  根据骑行记录的identifier获取完整的骑行记录
// *
// *  @param  identifier 骑行记录identifer
// *  @param  database   s数据库实例
// *
// *  @return 完整的骑行记录
// */
////+ (ActivityModel*)getCyclingRecordWithActivityIdentifier:(NSString*)identifier database:(FMDatabase*)database{
////    FMResultSet* result = [database executeQuery:@"select * from cycling_record_table where user_id = ? and activity_identify = ?", [[[UserManager ShareInstance] userModel] userid], identifier];
////    if([result next]){
////        return [ActivityManager activityModelWithDictionary:[result resultDictionary]];
////    }
////    return nil;
////}
//
//#pragma mark - 更新数据库操作
//
///**
// *  @brief 更新骑行记录中打点的下载状态
// *
// *  @param state      打点下载状态
// *  @param identifier 骑行记录 sport identifier
// *  @see   CyclingRecordSamplesStatus
// *  @param database   数据库实例
// */
////+ (void)updateSampleState:(CyclingRecordSamplesStatus)state identifier:(NSString*)identifier database:(FMDatabase*)database{
//////    [database executeUpdate:@"update cycling_record_table set cycling_record_samples_status = ? where user_id = ? and activity_identify = ?", @(state), [[[UserManager ShareInstance] userModel] userid], identifier];
////}
//
///**
// *  @brief 更新数据点的上传状态
// *
// *  @param uploaded   打点上传状态
// *  @param identifier 骑行记录id
// *  @param database   数据库实例
// */
//+ (void)updateSamplesUploadState:(BOOL)uploaded identifier:(NSString*)identifier database:(FMDatabase*)database{
////    [database executeUpdate:@"update cycling_record_table set samples_upload = ? where user_id = ? and activity_identify = ?", @(uploaded), [[[UserManager ShareInstance] userModel] userid], identifier];
//}
//
///**
// *  @brief 更新骑行记录的上传状态
// *
// *  @param isSynced YES:已上传，NO:未上传
// *  @param database 数据库实例
// */
//+ (void)updateCyclingRecordSyncStatus:(BOOL)isSynced identifier:(NSString*)identifier database:(FMDatabase*)database{
////    [database executeUpdate:@"update cycling_record_table set is_synced = ? where user_id = ? and activity_identify = ?", @(isSynced), [[[UserManager ShareInstance] userModel] userid], identifier];
//}
//
///**
// *  @brief 更新是否为作弊数据的字段
// *
// *  @param isFake     YES:作弊数据
// *  @param identifier sport identifier
// *  @param database   数据库实例
// */
//+ (void)updateIsFake:(BOOL)isFake identifier:(NSString*)identifier database:(FMDatabase*)database{
////    [database executeUpdate:@"update cycling_record_table set is_fake = ? where user_id = ? and activity_identify = ?", @(isFake), [[[UserManager ShareInstance] userModel] userid], identifier];
//}
//
///**
// *  @brief 更新骑行记录对应的服务器数据表的 id
// *
// *  @param activityId 服务器数据表
// *  @param identifier sport identifier
// *  @param database   数据库实例
// */
//+ (void)updateActivityId:(NSString*)activityId identifier:(NSString*)identifier database:(FMDatabase*)database{
////    [database executeUpdate:@"update cycling_record_table set activity_id = ? where user_id = ? and activity_identify = ?", activityId, [[[UserManager ShareInstance] userModel] userid], identifier];
//}
//
///**
// *  @brief  更新骑行记录骑行是否结束的状态
// *
// *  @param  finished   YES:骑行结束, NO:骑行未结束
// *  @param  identifier 骑行记录identfier
// *  @param  database   数据库实例
// */
//+ (void)updateCyclingFinisheState:(BOOL)finished identifier:(NSString*)identifier database:(FMDatabase*)database{
////    [database executeUpdate:@"update cycling_record_table set isCyclingFinished = ? where user_id = ? and activity_identify = ?", @(finished), [[[UserManager ShareInstance] userModel] userid], identifier];
//    [ActivityManager deleteCyclingRecordArrays:identifier database:database];
//}
//
///**
// *  @brief  更新骑行记录结束时间
// *
// *  @param  stopDate   结束时间
// *  @param  identifier 骑行记录identifer
// *  @param  database   数据库实例
// */
//+ (void)updateCyclingStopDate:(NSDate*)stopDate identifier:(NSString*)identifier database:(FMDatabase*)database{
////    [database executeUpdate:@"update cycling_record_table set stop_date = ? where user_id = ? and activity_identify = ?", stopDate, [[[UserManager ShareInstance] userModel] userid], identifier];
//}
//
///**
// *  @brief  更行骑行记录的最大速度
// *
// *  @param  speed_max  最大速度值（km/h）
// *  @param  identifier 骑行记录identifier
// *  @param  database   数据库实例
// */
////+ (void)updateCyclingRecordMaxSpeed:(CGFloat)speed_max identifier:(NSString*)identifier database:(FMDatabase*)database{
//////    [database executeUpdate:@"update cycling_record_table set speed_max = ? where user_id = ? and activity_identify = ?", @(speed_max), [[[UserManager ShareInstance] userModel] userid], identifier];
////}
//
///**
// *  @brief  更新骑行记录的平均速度
// *
// *  @param  speed_avg  平均速度值(km/h)
// *  @param  identifier 骑行记录的identifier
// *  @param  database   数据库实例
// */
////+ (void)updateCyclingRecordAvageSpeed:(CGFloat)speed_avg identifier:(NSString*)identifier database:(FMDatabase*)database{
//////    [database executeUpdate:@"update cycling_record_table set speed_average = ? where user_id = ? and activity_identify = ?", @(speed_avg), [[[UserManager ShareInstance] userModel] userid], identifier];
////}
//
//
///**
// *  @brief  更新骑行记录的总时间
// *
// *  @param  totalTime  总时间（s）
// *  @param  identifier 骑行记录的totalTime
// *  @param  database   数据库实例
// */
////+ (void)updateCyclingTotalTime:(CGFloat)totalTime identifier:(NSString*)identifier database:(FMDatabase*)database{
////    [database executeUpdate:@"update cycling_record_table set time_total = ? where user_id = ? and activity_identify = ?", @(totalTime), [[[UserManager ShareInstance] userModel] userid], identifier];
////}
//
///**
//*  @brief  更新骑行记录总里程
//*
//*  @param  distance   总里程（km）
//*  @param  identifier 骑行记录identifier
//*  @param  database   数据库实例
//*/
////+ (void)updateCyclingRecordDistanceTotal:(CGFloat)distance identifier:(NSString*)identifier database:(FMDatabase*)database{
////    [database executeUpdate:@"update cycling_record_table set distance_total = ? where user_id = ? and activity_identify = ?", @(distance), [[[UserManager ShareInstance] userModel] userid], identifier];
////}
//
///**
// *  @brief  更新骑行记录总消耗卡路里
// *
// *  @param  distance   总消耗卡路里（kC）
// *  @param  identifier 骑行记录identifier
// *  @param  database   数据库实例
// */
////+ (void)updateCyclingRecordCalories:(CGFloat)calories identifier:(NSString*)identifier database:(FMDatabase*)database{
////    [database executeUpdate:@"update cycling_record_table set calories_total = ? where user_id = ? and activity_identify = ?", @(calories), [[[UserManager ShareInstance] userModel] userid], identifier];
////}
//
///**
// *  @brief  更新骑行记录的标题
// *
// *  @param  title      骑行记录标题
// *  @param  identifier 骑行记录identifier
// *  @param  database   数据库实例
// */
//+ (void)updateCyclingRecordTitle:(NSString*)title identifier:(NSString*)identifier database:(FMDatabase*)database{
//    [database executeUpdate:@"update cycling_record_table set title = ? where activity_identify = ?", title, identifier];
//}
//
///**
// *  @brief  更新骑行记录缩略图
// *
// *  @param  imageRelativePath 骑行记录缩略图的相对路径
// *  @param  identifier        骑行记录identifier
// *  @param  database          数据库实例
// */
//+ (void)updateCYclingRecordThumbImage:(NSString*)imageRelativePath identifier:(NSString*)identifier database:(FMDatabase*)database{
////    [database executeUpdate:@"update cycling_record_table set cycling_image = ? where user_id = ? and activity_identify = ?", imageRelativePath, [[[UserManager ShareInstance] userModel] userid], identifier];
//}

@end
