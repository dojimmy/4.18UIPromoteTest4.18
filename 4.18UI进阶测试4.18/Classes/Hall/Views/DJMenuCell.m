//
//  DJMenuCell.m
//  4.18UI进阶测试4.18
//
//  Created by 邓金明 on 16/4/18.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJMenuCell.h"

@interface DJMenuCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *titleView;

@end


@implementation DJMenuCell


-(void)setSubMenu:(DJSubMenu *)subMenu{

    _subMenu = subMenu;
    
    self.iconView.image = [UIImage imageNamed:subMenu.icon];
    
    self.iconView.contentMode = UIViewContentModeCenter;//让图片按素材大小且位于控件中间
    
    self.titleView.text = subMenu.name;
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

@end
