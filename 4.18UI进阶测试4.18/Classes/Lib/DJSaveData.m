//
//  DJSaveData.m
//  4.18UI进阶测试4.18
//
//  Created by 邓金明 on 16/4/19.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJSaveData.h"

@implementation DJSaveData


+(void)saveBool:(BOOL)value ForKey:(NSString *)key{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setBool:value forKey:key];
    
    [defaults synchronize];
    
}

+(BOOL)getBoolForKey:(NSString *)key{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    return [defaults boolForKey:key];
    
}


+(void)changeBoolForKey:(NSString *)key{

    BOOL value = [self getBoolForKey:key];
    
    [self saveBool:!value ForKey:key];
}


@end
