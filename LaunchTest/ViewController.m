//
//  ViewController.m
//  LaunchTest
//
//  Created by 彭明均 on 2022/8/9.
//

#import "ViewController.h"
#import "PushTest/SecondVC.h"
#import "PushTest/ThirdVC.h"
#import "MoreVC/MoreVC.h"

@interface ViewController ()

@property UILabel* count;//显示点击次数
@property NSInteger tapCount;//点击次数
//@property UINavigationController* navi;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
    
}

- (void) viewWillAppear:(BOOL)animated{
    NSLog(@"当前第一页，栈中有如下：");
    for(UIViewController* temp in self.navigationController.viewControllers){
        NSLog(@"%@ ",temp);
    }
}

- (void)createUI {
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    //定义并且创建一个UILabel对象,注意与UIButton创建有区别
    //UILabel是可以显示在屏幕上的，并且可以显示文字的一种UI视图
    //alloc 分配内存和空间 init 初始化
    UILabel* label = [[UILabel alloc] init];

    //设置文字的赋值，字符串对象，不可以是数字
    label.text = @"Hello Apple!";
    
    //设定label的显示位置
    label.frame = CGRectMake(0, self.view.frame.size.height/2-15, self.view.frame.size.width, 30);

    //设置label的背景颜色,clearColor表示透明的颜色
//    label.backgroundColor = [UIColor whiteColor];
    //self.view.backfroundColor = [UIColor redColor];

    //设置label文字的大小，使用系统默认字体，大小为12
    label.font = [UIFont fontWithName:@"Arial-BoldMT" size:30];

    //设置文字的颜色
    label.textColor = [UIColor blackColor];

    //label的高级属性
    //设定阴影的颜色
    label.shadowColor = [UIColor clearColor];

    //设置text文字的对齐模式,默认为靠左侧对齐
    label.textAlignment = NSTextAlignmentCenter;

    //设置label文字显示的行数,默认值为：1 只用一行来显示
    //其他的>0的行数，文字会尽量按照设定行数来显示
    //如果值为0:iOS会对文字自动计算所需要的行数，按照需要的行数来显示文字
    label.numberOfLines = 0;
    
    //将label显示到屏幕上(可千万不敢忘了)
    [self.view addSubview:label];
    
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap:)];
    [label addGestureRecognizer:tap];
    
    self.count = [[UILabel alloc] init];
    self.count.frame = CGRectMake(0, self.view.frame.size.height-100, self.view.frame.size.width, 50);
//    self.count.backgroundColor = [UIColor whiteColor];
    self.count.text = [NSString stringWithFormat:@"%ld",_tapCount];
    self.count.textAlignment = NSTextAlignmentCenter;
    self.count.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];
    [self.view addSubview:self.count];
    
    UIButton* secbtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-120, self.view.frame.size.height-200, 80, 40)];
    [secbtn setTitle:@"去第二页" forState:UIControlStateNormal];
    [secbtn setBackgroundColor: [UIColor grayColor]];
    secbtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [secbtn.layer setCornerRadius:10.0];
    
    [secbtn addTarget:self action:@selector(pushSecAction) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:secbtn];
    
    UIButton* thirdbtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2+40, self.view.frame.size.height-200, 80, 40)];
    [thirdbtn setTitle:@"去第三页" forState:UIControlStateNormal];
    [thirdbtn setBackgroundColor: [UIColor grayColor]];
    thirdbtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [thirdbtn.layer setCornerRadius:10.0];
    
    [thirdbtn addTarget:self action:@selector(pushThirdAction) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:thirdbtn];
    
    UIButton* moreBtn = [[UIButton alloc] init];
    moreBtn.backgroundColor = [UIColor clearColor];
    [moreBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [moreBtn addTarget:self action:@selector(moreBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [moreBtn.widthAnchor constraintEqualToConstant:25.0].active = YES;
    [moreBtn.heightAnchor constraintEqualToConstant:25.0].active = YES;
    
    UIBarButtonItem* rightBtn = [[UIBarButtonItem alloc] initWithCustomView:moreBtn];
    
//    UIBarButtonItem* rightBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"more"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:nil action:nil];

    self.navigationItem.rightBarButtonItem = rightBtn;
    
}

- (void)labelTap:(UITapGestureRecognizer *)recognizer {
    _tapCount ++;
    UILabel *label = (UILabel *)recognizer.view;
    if([label.text isEqual:@"Hello Apple!"]){
        label.text = @"Hello World!";
    }
    else{
        label.text = @"Hello Apple!";
    }
    self.count.text = [NSString stringWithFormat:@"%ld",_tapCount];
    NSLog(@"你点击了label %ld 次，它变成了：%@", self.tapCount, label.text);
}

- (void)pushSecAction {
    NSLog(@"你点了按钮");
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

- (void)pushThirdAction {
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

- (void) moreBtnClicked{
    [self.navigationController pushViewController:[MoreVC new] animated:YES];
}

@end
