//
//  PTabBarVC.m
//  LaunchTest
//
//  Created by 彭明均 on 2022/8/10.
//

#import <Foundation/Foundation.h>
#import "PTabBarVC.h"
#import "PTabbarItem.h"
#import "PRootTabItemModel.h"

@interface PTabBarVC()<UITabBarControllerDelegate>

@property (nonatomic,assign) NSInteger indexFlag;

@property (nonatomic) MainVC* mainVC;
@property (nonatomic) MineVC* mineVC;
@property (nonatomic) MemberVC* memberVC;
@property (nonatomic) OrderVC* orderVC;

//@property (nonatomic) PTabbarView *tabbar;

@end


@implementation PTabBarVC

- (void)viewDidLoad {
    self.tabBar.backgroundColor = [UIColor whiteColor];
    
    self.indexFlag = 0;
    [super viewDidLoad];
    
    self.mainVC = [[MainVC alloc] init];
    self.memberVC = [[MemberVC alloc] init];
    self.orderVC = [[OrderVC alloc] init];
    self.mineVC = [[MineVC alloc] init];
    
    self.viewControllers = @[_mainVC, _memberVC, _orderVC, _mineVC];
    
    for (UIViewController *controller in self.viewControllers) {
        UIView *view= controller.view;
    }
    
}

#pragma mark --tabs
- (id<PTabbarItem>)mainTabItem
{
    id<PTabbarItem> first = [self tabItemWithTitle:@"主页" imageName:@"main" selectedImageName:@"main_s"];
    return first;
}
- (id<PTabbarItem>)memberTabItem
{
    id<PTabbarItem> second = [self tabItemWithTitle:@"会员" imageName:@"member" selectedImageName:@"member_s"];
    return second;
}
- (id<PTabbarItem>)orderTabItem
{
    id<PTabbarItem> third = [self tabItemWithTitle:@"订单" imageName:@"order" selectedImageName:@"order_s"];
    return third;
}
- (id<PTabbarItem>)mineTabItem
{
    id<PTabbarItem> forth = [self tabItemWithTitle:@"我的" imageName:@"mine" selectedImageName:@"mine_s"];
    return forth;
}

- (id<PTabbarItem>)tabItemWithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    id<PTabbarItem> tabItem = [PRootTabItemModel new];
    tabItem.title = title;
    tabItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    tabItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    return tabItem;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(nonnull UITabBarItem *)item{
    NSInteger index = [self.tabBar.items indexOfObject:item];
    if (index != self.indexFlag) {
        //执行动画
        NSMutableArray *arry = [NSMutableArray array];
        for (UIView *btn in self.tabBar.subviews) {
            if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [arry addObject:btn];
            }
        }
        //添加动画
        //放大效果，并回到原位
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        //速度控制函数，控制动画运行的节奏
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.duration = 0.2;       //执行时间
        animation.repeatCount = 1;      //执行次数
//        animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
        animation.fromValue = [NSNumber numberWithFloat:0.6];   //初始伸缩倍数
        animation.toValue = [NSNumber numberWithFloat:1.1];     //结束伸缩倍数
        [[arry[index] layer] addAnimation:animation forKey:nil];
        
        self.indexFlag = index;
    }
}

@end
