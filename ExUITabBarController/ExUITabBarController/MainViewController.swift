//
//  ViewController.swift
//  ExUITabBarController
//
//  Created by 8000 on 2018/12/4.
//  Copyright © 2018 Cross. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //* UILabel
        let myLabel = UILabel(frame: CGRect(x: 50, y: 100, width: 200, height: 50))
        myLabel.textAlignment = .center
        myLabel.textColor = UIColor .blue
        myLabel.font = UIFont.systemFont(ofSize: 17)
        myLabel.backgroundColor = UIColor .lightGray
        myLabel.text = "Home"
        self.view.addSubview(myLabel)
    }


}

