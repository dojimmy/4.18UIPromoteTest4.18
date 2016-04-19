//
//  DJSubMenu.m
//  4.18UI进阶测试4.18
//
//  Created by 邓金明 on 16/4/19.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJSubMenu.h"

@implementation DJSubMenu

-(instancetype)initWithDic:(NSDictionary *)dic{

    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+(instancetype)subMenusWithDic:(NSDictionary *)dic{

    return [[self alloc] initWithDic:dic];
}

@end
