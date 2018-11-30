//
//  ArticleViewController.swift
//  ExUINavigationController
//
//  Created by 8000 on 2018/11/29.
//  Copyright © 2018 Cross. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    var passInfo:String = "PassInfo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.title = "Article"
        
        let rightButton = UIBarButtonItem(barButtonSystemItem:.edit, target: self, action: #selector(ArticleViewController.edit))
        self.navigationItem.rightBarButtonItem = rightButton
        
        let myButton = UIButton(frame: CGRect(x: 0, y: 100, width: 120, height: 40))
        myButton.setTitle("返回首页", for: .normal)
        myButton.backgroundColor = UIColor.blue
        myButton.addTarget(self, action: #selector(ArticleViewController.back), for: .touchUpInside)
        self.view.addSubview(myButton)
        
        print("PassInfo:" + passInfo)
    }
    
    @objc func edit(){
        print("edit action")
    }
    
    @objc func back(){
        // popViewController() : 返回上一页
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
