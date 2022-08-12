//
//  ThirdVC.m
//  LaunchTest
//
//  Created by 彭明均 on 2022/8/10.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "ThirdVC.h"
#import "SecondVC.h"

@interface ThirdVC()

@property UILabel* thirdLabel;

@end

@implementation ThirdVC

- (void) viewDidLoad{
    [self createUI];
}

- (void) viewWillAppear:(BOOL)animated{
    NSLog(@"当前第三页，栈中有如下：");
    for(UIViewController* temp in self.navigationController.viewControllers){
        NSLog(@"%@ ",temp);
    }
}

- (void) createUI{
    self.thirdLabel = [[UILabel alloc] init];
    self.thirdLabel.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.thirdLabel.text = @"你来到了第三个页面！";
    self.thirdLabel.backgroundColor = [UIColor whiteColor];
    self.thirdLabel.textAlignment = NSTextAlignmentCenter;
    self.thirdLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:25];
    [self.view addSubview:self.thirdLabel];
    
    //回第一页的button
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(self.view.frame.size.width/2-120, self.view.frame.size.height-200, 80, 40);
    [btn setTitle:@"回第一页" forState:UIControlStateNormal];
    btn.tintColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchDown];
    [btn.layer setCornerRadius:10.0];
    btn.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:btn];
    
    //去第二页的button
    UIButton* secBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    secBtn.frame = CGRectMake(self.view.frame.size.width/2+40, self.view.frame.size.height-200, 80, 40);
    [secBtn setTitle:@"去第二页" forState:UIControlStateNormal];
    secBtn.tintColor = [UIColor whiteColor];
    [secBtn addTarget:self action:@selector(secBtnClicked) forControlEvents:UIControlEventTouchDown];
    [secBtn.layer setCornerRadius:10.0];
    secBtn.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:secBtn];
}
- (void) btnClicked {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void) secBtnClicked {
    BOOL isSeek = NO;
    //首先去栈中寻找是否有曾经push的
    for(UIViewController* temp in self.navigationController.viewControllers){
        if([temp isKindOfClass:[SecondVC class]]){
            isSeek = YES;
            NSLog(@"找到了SecondVC，让我看看！");
            [self.navigationController popToViewController:temp animated:YES];
        }
    }
    //如果没有再创建并跳转
    if(!isSeek){
        [self.navigationController pushViewController:[SecondVC new] animated:YES];
    }
}

@end
