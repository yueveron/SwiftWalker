//
//  AppDelegate.swift
//  PremierLeague
//
//  Created by 8000 on 2018/12/6.
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
        myTabBar.tabBar.barTintColor = UIColor.white
        myTabBar.tabBar.tintColor = UIColor.init(red: 56/255.0, green: 0/255.0, blue: 60/255.0, alpha: 1.0)
        
        
        // Home
        let homeViewController = UINavigationController(rootViewController: ViewController())
//        let homeViewController = testDefaultPage(uiViewController: TeamDetailViewController())
        homeViewController.tabBarItem = UITabBarItem(title: "首页", image: UIImage(named: "home"), tag: 1)
        
        // Team
        let teamViewController = UINavigationController(rootViewController: TeamMainViewController())
        teamViewController.tabBarItem = UITabBarItem(title: "球队", image: UIImage(named: "team"), tag: 1)
        
        let cityViewController = CityMainViewController()
        cityViewController.tabBarItem = UITabBarItem(title: "城市", image: UIImage(named: "city"), tag: 2)
        
        let userViewController = UserMainViewController()
        userViewController.tabBarItem = UITabBarItem(title: "我的", image: UIImage(named: "user"), tag: 3)
        
        //子控制器加入到 UITabBarController
        myTabBar.viewControllers = [
            homeViewController,
            teamViewController,
            cityViewController,
            userViewController
        ]
        
        //预设开启的页面
        myTabBar.selectedIndex = 0
        
        //设置根视图控制器
        self.window?.rootViewController = myTabBar
        
        self.window?.makeKeyAndVisible()
        
        
        return true
        
    }
    
    func testDefaultPage(uiViewController : UIViewController) -> UINavigationController{
        return UINavigationController(rootViewController: uiViewController)
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

