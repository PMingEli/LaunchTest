//
//  MainVC.m
//  LaunchTest
//
//  Created by 彭明均 on 2022/8/10.
//

#import <Foundation/Foundation.h>
#import "MainVC.h"
#import "UIColor+Hex.h"

@interface MainVC()

@property UILabel* label;
@property UIScrollView* scrollView;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor colorWithHexString:@"#dbdbdb" alpha:0.95];
    
    //设置视图控制器标题
    self.title=@"主页";
    
    //注意通过tabBarController或者parentViewController可以得到其俯视图控制器
    NSLog(@"%i",self.tabBarController==self.parentViewController);//对于当前应用二者相等
    
    //设置图标、标题(tabBarItem是显示在tabBar上的标签)
    self.tabBarItem.title=@"主页";//注意如果这个标题不设置默认在页签上显示视图控制器标题
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"#ea4d74"],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    self.tabBarItem.image=[[UIImage imageNamed:@"main"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//默认图片
    self.tabBarItem.selectedImage=[[UIImage imageNamed:@"main_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//选中图片
    
//    //图标右上角内容
//    self.tabBarItem.badgeValue=@"5";
    [self createUI];
}

- (void)createUI {
    self.scrollView = [UIScrollView new];
    self.scrollView.contentSize = CGSizeMake(0, self.view.frame.size.height*2);
    
    
    
    self.label = [[UILabel alloc] init];
    self.label.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.label.text = @"这是首页！";
    self.label.numberOfLines = 0;
    self.label.backgroundColor = [UIColor clearColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont fontWithName:@"Arial-BoldMT" size:50];
    [self.view addSubview:self.label];
    
//    [self.scrollView addSubview:self.label];
//    [self.view addSubview:self.scrollView];
}

@end
