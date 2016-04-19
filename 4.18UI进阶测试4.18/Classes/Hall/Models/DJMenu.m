//
//  DJMenu.m
//  4.18UI进阶测试4.18
//
//  Created by 邓金明 on 16/4/18.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJMenu.h"

@implementation DJMenu

+(NSArray *)menusIsNeedFilter:(BOOL)isNeedfilter{
    
    NSArray *dicArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MyAccount.plist" ofType:nil]];
    
    NSMutableArray *desArr = [NSMutableArray array];
    
    NSMutableArray *filterArr = [NSMutableArray array];
    
    for (NSDictionary *dic in dicArr) {
        
        DJMenu *menu = [DJMenu menuWithDic:dic];
        
        for (DJSubMenu *subMenu in menu.subMenus) {
            
            if (isNeedfilter && [DJSaveData getBoolForKey:subMenu.name]) {
                
                [filterArr addObject:subMenu];
                
            }
        }
        [desArr addObject:menu];
    }
    
    if (isNeedfilter) {
        
        return filterArr;
    }
    return desArr;

}

-(instancetype)initWithDic:(NSDictionary *)dic{

    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
        
        NSMutableArray *desArr = [NSMutableArray array];
        
        for (NSDictionary *dic in self.subMenus) {
            
            DJSubMenu *subMenu = [DJSubMenu subMenusWithDic:dic];
            
            [desArr addObject:subMenu];
        }
        self.subMenus = desArr;
    }
    return self;
}


+(instancetype)menuWithDic:(NSDictionary *)dic{
    
    return [[self alloc] initWithDic:dic];
}

@end
