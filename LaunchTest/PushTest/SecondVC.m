//
//  SecondVC.m
//  LaunchTest
//
//  Created by 彭明均 on 2022/8/10.
//

#import <Foundation/Foundation.h>
#import "SecondVC.h"
#import "ThirdVC.h"

@interface SecondVC()

@property UILabel* secLabel;

@end

@implementation SecondVC

- (void) viewDidLoad{
    [self createUI];
}

- (void) viewWillAppear:(BOOL)animated {
    NSLog(@"当前第二页，栈中有如下：");
    for(UIViewController* temp in self.navigationController.viewControllers){
        NSLog(@"%@ ",temp);
    }
}

- (void) createUI{
    self.secLabel = [[UILabel alloc] init];
    self.secLabel.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.secLabel.text = @"你来到了第二个页面！";
    self.secLabel.backgroundColor = [UIColor whiteColor];
    self.secLabel.textAlignment = NSTextAlignmentCenter;
    self.secLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:25];
    [self.view addSubview:self.secLabel];
    
    UIButton* firstbtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    firstbtn.frame = CGRectMake(self.view.frame.size.width/2-120, self.view.frame.size.height-200, 80, 40);
    [firstbtn setTitle:@"回第一页" forState:UIControlStateNormal];
    firstbtn.tintColor = [UIColor whiteColor];
    [firstbtn.layer setCornerRadius:10.0];
    [firstbtn addTarget:self action:@selector(firstBtnClicked) forControlEvents:UIControlEventTouchDown];
    firstbtn.backgroundColor = [UIColor grayColor];
    
    
    [self.view addSubview:firstbtn];
    
    UIButton* thirdbtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    thirdbtn.frame = CGRectMake(self.view.frame.size.width/2+40, self.view.frame.size.height-200, 80, 40);
    [thirdbtn setTitle:@"去第三页" forState:UIControlStateNormal];
    thirdbtn.tintColor = [UIColor whiteColor];
    [thirdbtn.layer setCornerRadius:10.0];
    [thirdbtn addTarget:self action:@selector(ThirdBtnClicked) forControlEvents:UIControlEventTouchDown];
    thirdbtn.backgroundColor = [UIColor grayColor];
    
    
    [self.view addSubview:thirdbtn];
}

- (void) ThirdBtnClicked {
    BOOL isSeek = NO;
    //首先去栈中寻找是否有曾经push的
    for(UIViewController* temp in self.navigationController.viewControllers){
        if([temp isKindOfClass:[ThirdVC class]]){
            isSeek = YES;
            NSLog(@"找到了ThirdVC，让我看看！");
            [self.navigationController popToViewController:temp animated:YES];
        }
    }
    //如果没有再创建并跳转
    if(!isSeek){
        [self.navigationController pushViewController:[ThirdVC new] animated:YES];
    }
}

- (void) firstBtnClicked {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
