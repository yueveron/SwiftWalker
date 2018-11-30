//
//  ViewController.swift
//  ExUINavigationController
//
//  Created by 8000 on 2018/11/29.
//  Copyright © 2018 Cross. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //
        self.view.backgroundColor = UIColor.darkGray
        self.title = "首页"

        //导航栏底色
        self.navigationController?.navigationBar.barTintColor = UIColor.lightGray
        self.navigationController?.navigationBar.isTranslucent = false

        //导航栏左侧按钮
        let leftButton = UIBarButtonItem(image: UIImage(named: "check"), style: .plain, target: self, action: #selector(ViewController.check))
        self.navigationItem.leftBarButtonItem = leftButton

        //导航栏右侧按钮
        let rightButton = UIBarButtonItem(title: "设置", style: .plain, target: self, action: #selector(ViewController.setting))
        self.navigationItem.rightBarButtonItem = rightButton
        
        //隐藏导航栏
//        self.navigationController?.isNavigationBarHidden = true;
        
        //新建一个按钮
        let myButton = UIButton(frame: CGRect(x: 0, y: 20, width: 120, height: 40))
        myButton.setTitle("Article", for: .normal)
        myButton.backgroundColor = UIColor.blue
        myButton.addTarget(self, action: #selector(ViewController.article), for: .touchUpInside)
        self.view.addSubview(myButton)
    }
    
    @objc func check(){
        print("check button action")
    }
    
    @objc func setting(){
        // pushViewController(), 参数表示要前往的页面ViewController，及是否要过场动画
        self.navigationController?.pushViewController(SettingViewController(), animated: true)
    }
    
    @objc func article(){
        let articleViewController = ArticleViewController()
        //传参给 articleViewController
        articleViewController.passInfo = "首页"
        // pushViewController(), 参数表示要前往的页面ViewController，及是否要过场动画
        self.navigationController?.pushViewController(articleViewController, animated: true)
        //显示导航栏
//        self.navigationController?.setNavigationBarHidden(false, animated: false)
        //
        
        
    }
    
    


}

