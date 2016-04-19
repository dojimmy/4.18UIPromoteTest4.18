//
//  DJMenuViewController.m
//  4.18UI进阶测试4.18
//
//  Created by 邓金明 on 16/4/18.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJMenuViewController.h"
#import "DJHeaderView.h"
#import "DJSubMenuCell.h"

@interface DJMenuViewController ()<DJHeaderViewDelegate>

@property (nonatomic,strong) NSArray *menus;

@end

@implementation DJMenuViewController


-(NSArray *)menus{

    if (!_menus) {
        _menus = [DJMenu menusIsNeedFilter:NO];
    }
    return _menus;
}

-(instancetype)init{

    if (self = [super init]) {
        
    }
    return [super initWithStyle:UITableViewStyleGrouped];
}

-(instancetype)initWithStyle:(UITableViewStyle)style{

    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的帐户";

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnClick)];
    
    
}
-(void)backBtnClick{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    if (self.block) {
        self.block();
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.menus.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    DJMenu *menu = self.menus[section];
    
    BOOL open = [DJSaveData getBoolForKey:menu.title];
    menu.open = open;
    return menu.open ? menu.subMenus.count:0;
}


//头部view
-(void)headerViewDidClick:(DJHeaderView *)headerView{
    
    NSIndexSet *set = [NSIndexSet indexSetWithIndex:[self.menus indexOfObject:headerView.menu]];
    [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    DJHeaderView *headView = [DJHeaderView headerView:tableView];
    headView.tag = section;
    headView.delegate = self;
    headView.menu = self.menus[section];
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"menuCell";
    DJSubMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell==nil) {
        cell = [[DJSubMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    DJMenu *menu = self.menus[indexPath.section];
    
    DJSubMenu *subMenu = menu.subMenus[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:subMenu.blackIcon];
    
    cell.textLabel.text = subMenu.name;
    
    UIButton *btn = [[UIButton alloc] init];
    
    [btn setBackgroundImage:[UIImage imageNamed:@"compose_guide_check_box_default"] forState:UIControlStateNormal];
    
    [btn setBackgroundImage:[UIImage imageNamed:@"compose_guide_check_box_check"] forState:UIControlStateSelected];
    [btn sizeToFit];

    BOOL selected = [DJSaveData getBoolForKey:subMenu.name];
    
    btn.selected = selected;
    
    btn.userInteractionEnabled = NO;
    
    cell.accessoryView = btn;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([DJMenu menusIsNeedFilter:YES].count > 7) {
        
        [SVProgressHUD showErrorWithStatus:@"够了啊"];
        return;
    }
    
    
    DJSubMenuCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    UIButton *btn = (UIButton *)cell.accessoryView;
    
    btn.selected = !btn.selected;
    
    DJMenu *menu = self.menus[indexPath.section];
    
    DJSubMenu *subMenu = menu.subMenus[indexPath.row];
    
    [DJSaveData changeBoolForKey:subMenu.name];

}

@end
