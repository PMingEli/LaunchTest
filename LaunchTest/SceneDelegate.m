//
//  SceneDelegate.m
//  LaunchTest
//
//  Created by 彭明均 on 2022/8/9.
//

#import "SceneDelegate.h"
#import "ViewController.h"
#import "PTabBarVC.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
//    //创建根视图控制器
//    ViewController* rootVC = [[ViewController alloc] init];
//    //创建UINavigationController，将根视图控制器作为它的根视图
//    UINavigationController* naviVC = [[UINavigationController alloc] initWithRootViewController:rootVC];
//    //设置window的根视图控制器为UINavigationController
//    self.window.rootViewController = naviVC;
//    self.window.backgroundColor = [UIColor whiteColor];
//    //显示Window
//    [self.window makeKeyAndVisible];
    
//
    PTabBarVC* tabbar = [PTabBarVC new];
    _window.rootViewController = tabbar;
    [_window makeKeyAndVisible];
    
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    NSLog(@"程序终止");
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    NSLog(@"获得焦点");
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
    NSLog(@"将要失去焦点");
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
    NSLog(@"进入前台");
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
    NSLog(@"进入后台");
}


@end
