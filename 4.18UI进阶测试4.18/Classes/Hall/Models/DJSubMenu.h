//
//  DJSubMenu.h
//  4.18UI进阶测试4.18
//
//  Created by 邓金明 on 16/4/19.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJSubMenu : NSObject

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *icon;

@property (nonatomic,copy) NSString *blackIcon;

@property (nonatomic,assign) BOOL selected;

@property (nonatomic,copy) NSString *className;

-(instancetype)initWithDic:(NSDictionary *)dic;

+(instancetype)subMenusWithDic:(NSDictionary *)dic;

@end
