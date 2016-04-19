//
//  DJSubMenuCell.h
//  4.18UI进阶测试4.18
//
//  Created by 邓金明 on 16/4/18.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DJSubMenuCell;

@protocol DJSubMenuCellDelegate <NSObject>

-(void)DJSubMenuCellButtonClick:(DJSubMenuCell *)cell indexPath:(NSIndexPath *)indexPath;

@end

@interface DJSubMenuCell : UITableViewCell


@property (nonatomic,weak) id<DJSubMenuCellDelegate>delegate;

@end
