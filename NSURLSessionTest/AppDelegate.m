//
//  AppDelegate.m
//  NSURLSessionTest
//
//  Created by mdd on 16/2/22.
//  Copyright © 2016年 com.personal. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/// 在第一次使用推送时，会有这样的疑问：didFinishLaunchingWithOptions会在每次打开程序时被调用，那是不是每次都会调用注册函数，每次都会弹窗询问用户"是否允许推送通知"？其实这个窗口只会在第一次打开程序时弹出一次，无论用户允许或不允许苹果会记住用户的选择，注册函数调用多次对用户也没什么影响
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    // iOS8之后和之前应区别对待
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
//        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeAlert | UIUserNotificationTypeSound categories:nil];
//        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
//    } else {
//        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIUserNotificationTypeSound];
//    }
    
    // 获取远程推送消息
    NSDictionary *userInfo = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
    if (userInfo) {
        // 有推送的消息，处理推送的消息
    }
    
    return YES;
}
/// 这个函数存在的意义在于：当用户在设置中关闭了通知时，程序启动时会调用此函数，我们可以获取用户的设置
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [application registerForRemoteNotifications];
}

/// 函数A:iOS7之后才有的方法，此函数无论是程序被杀死还是处于后台，都会被调用，因此如果是iOS7，则不必在didFinishLaunchingWithOptions中做处理
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // userInfo
}
/// iOS3之后才有，只有在程序处于后台时，用户点击了通知后才会被调用，应搭配didFinishLaunchingWithOptions使用
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // userInfo
}

/// 用户同意后，会调用此程序，获取系统的deviceToken，应把deviceToken传给服务器保存，此函数会在程序每次启动时调用(前提是用户允许通知)
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"deviceToken = %@",deviceToken);
}
@end



