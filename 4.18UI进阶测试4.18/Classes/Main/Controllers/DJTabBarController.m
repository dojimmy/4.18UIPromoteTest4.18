//
//  DJTabBarController.m
//  4.18UI进阶测试4.18
//
//  Created by 邓金明 on 16/4/18.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJTabBarController.h"

@interface DJTabBarController ()

@end

@implementation DJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINavigationController *nav1 = [self loadViewControllerWithStoryBoardName:@"Hall"];
    
    UINavigationController *nav2 = [self loadViewControllerWithStoryBoardName:@"Buy"];
    UINavigationController *nav3 = [self loadViewControllerWithStoryBoardName:@"Lucky"];
    UINavigationController *nav4 = [self loadViewControllerWithStoryBoardName:@"History"];
    UINavigationController *nav5 = [self loadViewControllerWithStoryBoardName:@"Mine"];
    
    
    nav1.tabBarItem.image = [[UIImage imageNamed:@"tab_home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav1.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_home"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    
    nav1.tabBarItem.title = @"购彩大厅";
    
    
    nav2.tabBarItem.image = [[UIImage imageNamed:@"tab_investment"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav2.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_investment_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    nav2.tabBarItem.title = @"合买跟单";
    
    
    nav3.tabBarItem.image = [[UIImage imageNamed:@"tab_loan"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav3.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_loan"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    
    nav3.tabBarItem.title = @"幸运选号";
    
    nav4.tabBarItem.image = [[UIImage imageNamed:@"tab_transfer"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav4.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_transfer"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    
    nav4.tabBarItem.title = @"开奖信息";
    
    
    nav5.tabBarItem.image = [[UIImage imageNamed:@"tab_information"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav5.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_information"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    
    nav5.tabBarItem.title = @"我的彩票";
    
    
    [self.tabBar setTintColor:[UIColor redColor]];
    
    self.viewControllers = @[nav1,nav2,nav3,nav4,nav5];
}



//加载sb
-(UINavigationController *)loadViewControllerWithStoryBoardName:(NSString *)sbName{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    
    
    UINavigationController *nav = [sb instantiateInitialViewController];
    
    return nav;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
