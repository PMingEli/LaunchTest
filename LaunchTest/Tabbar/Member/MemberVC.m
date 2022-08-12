//
//  MemberVC.m
//  LaunchTest
//
//  Created by 彭明均 on 2022/8/10.
//

#import <Foundation/Foundation.h>
#import "MemberVC.h"
#import "UIColor+Hex.h"

@interface MemberVC()

@property UILabel* label;

@end

@implementation MemberVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor colorWithHexString:@"#dbdbdb" alpha:0.85];
    
    //设置视图控制器标题
    self.title=@"会员";
    
    //注意通过tabBarController或者parentViewController可以得到其俯视图控制器
    NSLog(@"%i",self.tabBarController==self.parentViewController);//对于当前应用二者相等
    
    //设置图标、标题(tabBarItem是显示在tabBar上的标签)
    self.tabBarItem.title=@"排行榜";//注意如果这个标题不设置默认在页签上显示视图控制器标题
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"#ea4d74"],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    self.tabBarItem.image=[[UIImage imageNamed:@"member"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//默认图片
    self.tabBarItem.selectedImage=[[UIImage imageNamed:@"member_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//选中图片
    
//    //图标右上角内容
//    self.tabBarItem.badgeValue=@"5";
    [self createUI];
}

- (void)createUI {
    self.label = [[UILabel alloc] init];
    self.label.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.label.text = @"这是排行榜页！";
    self.label.backgroundColor = [UIColor clearColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont fontWithName:@"Arial-BoldMT" size:30];
    [self.view addSubview:self.label];
}

@end
