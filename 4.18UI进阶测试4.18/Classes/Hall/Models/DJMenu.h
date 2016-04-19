//
//  DJMenu.h
//  4.18UI进阶测试4.18
//
//  Created by 邓金明 on 16/4/18.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DJSubMenu.h"

@interface DJMenu : NSObject

@property (nonatomic,copy) NSString *title;

@property (nonatomic,assign) BOOL open;

@property (nonatomic,strong) NSArray<DJSubMenu *> *subMenus;

+(NSArray *)menusIsNeedFilter:(BOOL)isNeedfilter;

@end
