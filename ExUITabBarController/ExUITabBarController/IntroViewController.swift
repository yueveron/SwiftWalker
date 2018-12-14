//
//  IntroViewController.swift
//  ExUITabBarController
//
//  Created by 8000 on 2018/12/4.
//  Copyright © 2018 Cross. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //* UILabel
        let myLabel = UILabel(frame: CGRect(x: 50, y: 100, width: 200, height: 50))
        myLabel.textAlignment = .center
        myLabel.textColor = UIColor .blue
        myLabel.font = UIFont.systemFont(ofSize: 17)
        myLabel.backgroundColor = UIColor .lightGray
        myLabel.text = "介绍页"
        self.view.addSubview(myLabel)
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
