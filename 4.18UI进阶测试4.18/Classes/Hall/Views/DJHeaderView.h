//
//  DJHeaderView.h
//  3.9QQ好友列表
//
//  Created by 邓金明 on 16/3/9.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJMenu.h"
@class DJHeaderView;
@protocol DJHeaderViewDelegate <NSObject>

@optional
-(void)headerViewDidClick:(DJHeaderView *)headerView;

@end


@interface DJHeaderView : UITableViewHeaderFooterView

@property (nonatomic,strong) DJMenu *menu;

+(instancetype)headerView:(UITableView *)tableView;

@property (nonatomic,strong) id<DJHeaderViewDelegate> delegate;

@end
