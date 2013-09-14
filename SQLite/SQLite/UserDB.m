//
//  UserDB.m
//  SQLite
//
//  Created by Hendy on 13-9-10.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "UserDB.h"
#import <sqlite3.h>

@implementation UserDB

- (void) createTable
{
    sqlite3 *sqlite = nil;
    
    NSString *dbPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.sqlite"];
    
    //打开数据库
    int result = sqlite3_open([dbPath UTF8String], &sqlite);
    if (result != SQLITE_OK) {
        NSLog(@"打开数据库失败");
        return;
    }
    
    NSString *sql = @"CREATE TABLE IF NOT EXISTS User (username TEXT primary key,password TEXT,email TEXT)";
    char *error;
    result = sqlite3_exec(sqlite, [sql UTF8String], nil, nil, &error);
    if (result != SQLITE_OK) {
        NSLog(@"创建表失败: %s", error);
        return;
    }
    
    sqlite3_close(sqlite);
}

- (void) insertUser
{
    sqlite3 *sqlite = nil;
    sqlite3_stmt *stmt = nil;
    
    NSString *dbPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.sqlite"];
    
    //打开数据库
    int result = sqlite3_open([dbPath UTF8String], &sqlite);
    if (result != SQLITE_OK) {
        NSLog(@"打开数据库失败");
        return;
    }
    
    NSString *sql = @"INSERT INTO User(username, password, email) values(?,?,?)";
    
    //编译SQL语句
    sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, nil);
    
    sqlite3_bind_text(stmt, 1, [@"Hendy" UTF8String], -1, nil);
    sqlite3_bind_text(stmt, 2, [@"123456" UTF8String], -1, nil);
    sqlite3_bind_text(stmt, 3, [@"hendy_o@qq.com" UTF8String], -1, nil);
    
    result = sqlite3_step(stmt);
    if (result == SQLITE_ERROR || result == SQLITE_MISUSE) {
        NSLog(@"执行SQL失败");
        return;
    }
    
    sqlite3_finalize(stmt);
    
    sqlite3_close(sqlite);
}

@end
