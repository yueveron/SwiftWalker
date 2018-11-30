//
//  ViewController.swift
//  SwiftTest


import UIKit

class ViewController: UIViewController {
    
    let stage:CGRect = UIScreen.main.bounds
    
    var sButton:SquishButton!
    var tempNum:CGFloat = 0
    
    var myLabel:UILabel!
    var myImageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pageWidth = stage.width
        let pageHeight = stage.height
        
        //* UILabel
        myLabel = UILabel(frame: CGRect(x: 0, y: pageHeight/2, width: pageWidth, height: 20))
        myLabel.textAlignment = .center
        myLabel.textColor = UIColor .blue
        myLabel.font = UIFont.systemFont(ofSize: 17)
        myLabel.backgroundColor = UIColor .lightGray
        myLabel.text = "I am a test Label"
        self.view.addSubview(myLabel)
        
        //* UIImage : named of Image in Assets.xcassets
        let newImage = UIImage(named: "hustleModeActivatedBG")
        //* UIImageView
        myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight))
        self.view.addSubview(myImageView)
        //* contentMode 设置缩放模式
        myImageView.contentMode = .scaleAspectFill //* 保持长宽比例下，缩放图片，使图片充满容器
        
        //* add UIImage to UIImageViews
        myImageView.image = newImage
        
        //* UIButton
        let myButton = UIButton.init(type: .custom)
        myButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        myButton.setTitle("Like this video", for: .normal)
        myButton.layer.borderWidth = 5.0
        myButton.layer.borderColor = UIColor.white.cgColor
        myButton.backgroundColor = UIColor.black
        myButton.titleLabel?.textColor = UIColor.white
        myButton.tintColor = UIColor.white
        myButton.layer.cornerRadius = 15.0
        myButton.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        myButton.tag = 1    //* 传参，只能传一个
//        self.view.addSubview(myButton)
        
        //* UIView
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        myView.backgroundColor = UIColor.blue
        myView.center = CGPoint(x: pageWidth/2, y: pageHeight/2)
        self.view.addSubview(myView)
        myView.addSubview(myButton)
        
        //* UITextView
        let myTextView = UITextView(frame: CGRect(x: 10, y: pageHeight, width: 250, height: 200))
        myTextView.textColor = UIColor.white
        myTextView.backgroundColor = UIColor.lightGray
//        myTextView.font = UIFont(name: "Hevetica-Light", size: 20)
        myTextView.textAlignment = .left
        self.view.addSubview(myTextView)
    }
    
    //* Button Click Function
    @objc func buttonClicked(_ button: UIButton) {
        let tag = button.tag
        print("Like this video is Clicked:\(tag)")
    }
    
}

