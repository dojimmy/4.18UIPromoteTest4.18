//
//  DJHeaderView.m
//  3.9QQ好友列表
//
//  Created by 邓金明 on 16/3/9.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJHeaderView.h"
#import "DJHeaderButton.h"

@interface DJHeaderView()
@property (nonatomic,weak) UIButton *nameView;
@property (nonatomic,weak) UILabel *numberView;
@end
@implementation DJHeaderView
+(instancetype)headerView:(UITableView *)tableView{

    NSString *ID = @"subMenus";
    DJHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headView ==nil) {
        headView = [[DJHeaderView alloc] initWithReuseIdentifier:ID];
    }
    return headView;
}
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
    
        DJHeaderButton *nameBtn = [[DJHeaderButton alloc] init];
        self.nameView = nameBtn;
        nameBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        [nameBtn setImage:[UIImage imageNamed:@"expandableImage"] forState:UIControlStateNormal];
        
        nameBtn.imageView.contentMode = UIViewContentModeRight;
        nameBtn.imageView.clipsToBounds = NO;
        
        nameBtn.backgroundColor = [UIColor whiteColor];

        [nameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        nameBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
        [self.contentView addSubview:nameBtn];
        
        
        [nameBtn addTarget:self action:@selector(headerViewDidClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    }
    return self;
}
-(void)headerViewDidClick{

    self.menu.open = !self.menu.open;
    
    [DJSaveData saveBool:self.menu.open ForKey:self.menu.title];
    
    [self.delegate headerViewDidClick:self];
    
}
-(void)layoutSubviews{

    [super layoutSubviews];
    self.nameView.frame = self.bounds;
    
    
}
-(void)setMenu:(DJMenu *)menu{

    _menu = menu;
    
    [self.nameView setTitle:menu.title forState:UIControlStateNormal];
}
- (void)willMoveToSuperview:(UIView *)newSuperview{

    [super willMoveToSuperview:newSuperview];
    if (self.menu.open) {
        self.nameView.imageView.transform = CGAffineTransformMakeRotation(M_PI);
    }else{
        self.nameView.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}
@end
