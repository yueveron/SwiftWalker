//
//  AppDelegate.swift
//  ExUITabBarController
//
//  Created by 8000 on 2018/12/4.
//  Copyright © 2018 Cross. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        
        // 创建 UITabBarController - 标签导航栏视图控制器，UITabBarController 本身并不会显示任何 View, 如果要显示 View 必须设置其内的各自View 属性
        let myTabBar = UITabBarController()
        
        // 设置标签列
        // 使用 UITabBarController's tabBar 各个属性进行样式设置（背景图片、背景颜色、系统图标颜色等）
        myTabBar.tabBar.backgroundColor = UIColor.clear
        
        
        // 创建页面，使用系统自带样式
        // 所有的 UITabController 的子控制器的相关标题、图标等信息均由子控制器设置，例如：子控制器使用 tabBarItem 属性设置标题与图标
        let mainViewController = MainViewController()
        mainViewController.tabBarItem = UITabBarItem(tabBarSystemItem:.favorites, tag: 0)
        
        // 创建页面，使用自定义图片样式，有预设图片
        let articleViewController = ArticleViewController()
        articleViewController.tabBarItem = UITabBarItem(title: "文章", image: UIImage(named: "file"), tag: 1)
        
        let introViewController = IntroViewController()
        introViewController.tabBarItem = UITabBarItem(title: "介绍", image: UIImage(named: "profile"), tag: 2)
        
        let settingViewController = SettingViewController()
        settingViewController.tabBarItem.image = UIImage(named: "settings")
        settingViewController.tabBarItem.title = "设定"
        settingViewController.tabBarItem.tag = 3
        
        //子控制器加入到 UITabBarController
        myTabBar.viewControllers = [
            mainViewController,
            articleViewController,
            introViewController,
            settingViewController
        ]
        
        //预设开启的页面
        myTabBar.selectedIndex = 0
        
        //设置根视图控制器
        self.window?.rootViewController = myTabBar
        
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

