//
//  AppDelegate.swift
//  ExUINavigationController
//
//  Created by 8000 on 2018/11/29.
//  Copyright © 2018 Cross. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 建立一个 UIWindow : UIWindow 用于显示 App 内所有 View，iOS 下只有一个 Window, 就是 self.window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // 设置底色
        self.window?.backgroundColor = UIColor.white
        
        // 设置 “rootViewController” : 根视图控制器， 此处为 UINavigationController - 导航Controller (参数：App 首页ViewController)
        let nav = UINavigationController(rootViewController: ViewController())
        self.window?.rootViewController = nav;
        
        // 将 UIWindow 设置为可见的，完成手动建立页面的步骤
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

