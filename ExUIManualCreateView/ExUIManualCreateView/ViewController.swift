//
//  ViewController.swift
//  ExUIManualCreateView
//
//  Created by 8000 on 2018/11/29.
//  Copyright © 2018 Cross. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let stage:CGRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let pageWidth = stage.width
        let pageHeight = stage.height
        
        //* UILabel
        let myLabel = UILabel(frame: CGRect(x: 0, y: pageHeight/2, width: pageWidth, height: 20))
        myLabel.textAlignment = .center
        myLabel.textColor = UIColor .blue
        myLabel.font = UIFont.systemFont(ofSize: 17)
        myLabel.backgroundColor = UIColor .lightGray
        myLabel.text = "I am a test Label"
        self.view.addSubview(myLabel)
        
    }


}

