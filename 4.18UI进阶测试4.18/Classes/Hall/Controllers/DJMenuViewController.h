//
//  DJMenuViewController.h
//  4.18UI进阶测试4.18
//
//  Created by 邓金明 on 16/4/18.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJMenu.h"

typedef void(^DJMenuViewControllerBlock)();


@interface DJMenuViewController : UITableViewController


@property (nonatomic,copy) DJMenuViewControllerBlock block;

@end
