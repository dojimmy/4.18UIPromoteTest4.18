//
//  DJSaveData.h
//  4.18UI进阶测试4.18
//
//  Created by 邓金明 on 16/4/19.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJSaveData : NSObject


+(void)saveBool:(BOOL)value ForKey:(NSString *)key;

+(BOOL)getBoolForKey:(NSString *)key;


+(void)changeBoolForKey:(NSString *)key;

@end
