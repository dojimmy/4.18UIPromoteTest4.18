//
//  DJHallViewController.m
//  4.18UI进阶测试4.18
//
//  Created by 邓金明 on 16/4/18.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJHallViewController.h"
#import "DJMenuViewController.h"
#import "DJNavigationController.h"

#import "DJMenuCell.h"
#import "DJMenu.h"
@interface DJHallViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,strong) NSMutableArray *menus;

@property (nonatomic,assign) NSInteger selCount;

@property (nonatomic,strong) DJSubMenu *addSubMenu;

@end

@implementation DJHallViewController

-(NSMutableArray *)menus{

    if (!_menus) {
        
        _menus = [NSMutableArray array];
        
        [_menus addObjectsFromArray:[DJMenu menusIsNeedFilter:YES]];

        [_menus addObject:self.addSubMenu];
    }
    return _menus;
}


-(DJSubMenu *)addSubMenu{

    if (_addSubMenu==nil) {
        _addSubMenu = [[DJSubMenu alloc] init];
        
        _addSubMenu.name = @"添加";
        _addSubMenu.icon = @"menu_collection_add";
        _addSubMenu.className = @"DJMenuViewController";
    }
    return _addSubMenu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
}


#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.menus.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    DJMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"menu" forIndexPath:indexPath];
    
    DJSubMenu *subMenu = self.menus[indexPath.item];
    
    cell.subMenu = subMenu;
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    
    DJSubMenu *subMenu = self.menus[indexPath.item];
    
    
    if (subMenu.className && subMenu.className.length > 0) {
        
        Class cla = NSClassFromString(subMenu.className);
        
        UIViewController *targetVC = [[cla alloc] init];
        
        
        if ([targetVC isKindOfClass:[DJMenuViewController class]]) {
            
            DJMenuViewController *VC = (DJMenuViewController *)targetVC;
            
            VC.block = ^{
            
                self.menus = nil;
                [collectionView reloadData];
            };
            
            DJNavigationController *nav = [[DJNavigationController alloc] initWithRootViewController:VC];
            
            
            [self presentViewController:nav animated:YES completion:nil];
            return;
        }
    }
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
