//
//  AppDelegate.m
//  Traveller
//
//  Created by TY on 14-3-19.
//  Copyright (c) 2014年 NewWorld. All rights reserved.
//

#import "AppDelegate.h"
#import <MAMapKit/MAMapKit.h>
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.tab = [[UITabBarController alloc] init];
    [MAMapServices sharedServices].apiKey = @"0576eb085c121d94c367066ea2606715";
    //首页推荐
    MainViewController *main=[[MainViewController alloc] init];
    [self.tab addChildViewController:main];
    //附近
    NearShopVC *near = [[NearShopVC alloc] init];
    [self.tab addChildViewController:near];
    //设置
    SettingVC *setting = [[SettingVC alloc] init];
    [self.tab addChildViewController:setting];
    //tab按钮
    main.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"推荐" image:nil selectedImage:nil];
    near.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"附近" image:nil selectedImage:nil];
    setting.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:nil selectedImage:nil];
    
    self.window.rootViewController = self.tab;
    self.window.backgroundColor = [UIColor whiteColor];

    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
