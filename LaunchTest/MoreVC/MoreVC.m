//
//  MoreVC.m
//  LaunchTest
//
//  Created by 彭明均 on 2022/8/11.
//

#import <Foundation/Foundation.h>
#import "MoreVC.h"
#import "../Tabbar/UIColor+Hex.h"

@interface MoreVC()

@property UILabel* label;

@end

@implementation MoreVC

- (void)viewDidLoad{
    self.view.backgroundColor = [UIColor colorWithHexString:@"#000000" alpha:0.2];
    [self createUI];
}

- (void)createUI{
    self.label = [UILabel new];
    self.label.frame = CGRectMake(0, 47+44, self.view.frame.size.width, 30);
    self.label.text = @"这是详情页。";
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = [UIColor clearColor];
    self.label.font = [UIFont fontWithName:@"Arial-BoldMT" size:25];
    
    [self.view addSubview:self.label];
}

@end
