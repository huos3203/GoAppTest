//
//  AppDelegate.m
//  GoAppTest
//
//  Created by pengyucheng on 14-2-11.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#import "singletonAlertView.h"
//#import <Crashlytics/Crashlytics.h>
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
//    [Crashlytics startWithAPIKey:@"4dde99d6e086d2458bb2353eac6b0729d4cde080"];
    // Override point for customization after application launch.
//    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    if (_currentViewContrl==nil) {
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        // determine the initial view controller here and instantiate it with [storyboard instantiateViewControllerWithIdentifier:<storyboard id>];
        
//        _currentViewContrl = [storyboard instantiateViewControllerWithIdentifier:@"indexContrl"];
//
//        self.window.rootViewController = [_currentViewContrl topViewController];
        
        
//        _currentViewContrl = [[[UIApplication sharedApplication]keyWindow]rootViewController];
//        UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"loginControllerId"];
////        [self.window.rootViewController addChildViewController:viewController];
//        _currentViewContrl = [[[self.window.rootViewController childViewControllers] objectAtIndex:0] topViewController];
//        NSLog(@"视图标题 ：%@",[_currentViewContrl title]);
//        
//        [self.window makeKeyAndVisible];
//        
//        [_currentViewContrl presentModalViewController:viewController animated:NO];
        
//        [Crashlytics startWithAPIKey:@"4dde99d6e086d2458bb2353eac6b0729d4cde080"];x
        
//        UITabBarController *eee = [[UITabBarController alloc] init];
//        UINavigationController *ee = [[UINavigationController alloc] init];
//        if ([_currentViewContrl isKindOfClass:[UITabBarController class]]) {
//            eee = _currentViewContrl;
//            _currentViewContrl = [[eee viewControllers] objectAtIndex:1];
//            if ([_currentViewContrl isKindOfClass:[UINavigationController class]]) {
//                _currentViewContrl = [_currentViewContrl topViewController];
//            }
//        }

    }
//    CLS_LOG(@"%@",@"调试bug");
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
    
    
   
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"alerthiden" object:self];
    
    [[singletonAlertView sharedsingletonAlertView] dismissWithClickedButtonIndex:0 animated:NO];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    _currentViewContrl = [[[UIApplication sharedApplication]keyWindow]rootViewController];
    
    //    _currentViewContrl = [[[UIApplication sharedApplication]keyWindow]rootViewController];
    UITabBarController *eee = [[UITabBarController alloc] init];
    UINavigationController *ee = [[UINavigationController alloc] init] ;
    
    if ([_currentViewContrl isKindOfClass:[UITabBarController class]]) {
        eee = _currentViewContrl;
        _currentViewContrl = [eee selectedViewController];
        if ([_currentViewContrl isKindOfClass:[UINavigationController class]]) {
            ee = _currentViewContrl;
            _currentViewContrl = [ee topViewController];
            NSLog(@"视图标题 ：%@",_currentViewContrl);
        }
    }

    if (_currentViewContrl!=nil) {

        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        // determine the initial view controller here and instantiate it with [storyboard instantiateViewControllerWithIdentifier:<storyboard id>];
        
        UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"loginControllerId"];
        
        [_currentViewContrl presentModalViewController:viewController animated:NO];
    }
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
