//
//  DJHeaderButton.m
//  4.18UI进阶测试4.18
//
//  Created by 邓金明 on 16/4/18.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJHeaderButton.h"

@implementation DJHeaderButton

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGRect frame = self.imageView.frame;
    frame.origin.x = CGRectGetMaxX(self.frame) - 40;
    self.imageView.frame = frame;
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
