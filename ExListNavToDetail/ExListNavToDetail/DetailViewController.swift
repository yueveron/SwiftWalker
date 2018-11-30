//
//  DetailViewController.swift
//  ExListNavToDetail
//
//  Created by 8000 on 2018/11/29.
//  Copyright © 2018 Cross. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    let stage:CGRect = UIScreen.main.bounds
    var myScrollView : UIScrollView!
    //
    var itemData:Dictionary = [String : String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "详情页"
        //
//        testCase();
        //
        renderUI()
    }
    
    func testCase(){
        itemData = ["name":"京东安","image":"man_0.jpg","intro":"简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介"]
    }
    
    func renderUI(){
//        print(itemData)
        self.view.backgroundColor = UIColor.white
        //
        let pageWidth = stage.width
        let pageHeight = stage.height
        //
        myScrollView = UIScrollView()
        myScrollView.frame = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight-84)
//        myScrollView.showsHorizontalScrollIndicator = false
//        myScrollView.isDirectionalLockEnabled = true
        myScrollView.isScrollEnabled = true
        self.view.addSubview(myScrollView);
        
        //* 姓名
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 20, width: pageWidth, height: 28))
        nameLabel.textAlignment = .center
        nameLabel.textColor = UIColor .black
//        nameLabel.backgroundColor = UIColor .lightGray
        nameLabel.font = UIFont.systemFont(ofSize: 28)
        nameLabel.text = itemData["name"]
//        self.view.addSubview(nameLabel)
        myScrollView.addSubview(nameLabel)
        
        //* 图片
        let imageUrl:String = itemData["image"] ?? ""
        let newImage = UIImage(named: imageUrl)
        //* UIImageView
//        let imageViewPosY = nameLabel.frame.origin.y + nameLabel.frame.height + 10
        let imageViewPosY = getUIItemPosY(uiItem: nameLabel)
//        print(imageViewPosY)
        let myImageView = UIImageView(frame: CGRect(x: 0, y: imageViewPosY, width: pageWidth, height: pageWidth))
        self.view.addSubview(myImageView)
        myImageView.contentMode = .scaleAspectFill //* 保持长宽比例下，缩放图片，使图片充满容器
        //* add UIImage to UIImageViews
        myImageView.image = newImage
        myScrollView.addSubview(myImageView)
        
        //* 简介
        let introTitlePosY = getUIItemPosY(uiItem: myImageView)
        let introTitleLabel = UILabel(frame: CGRect(x: 20, y: introTitlePosY, width: pageWidth-20, height: 20))
        introTitleLabel.textAlignment = .left
        introTitleLabel.textColor = UIColor .black
        introTitleLabel.font = UIFont.systemFont(ofSize: 20)
        introTitleLabel.text = "简介"
        
        let introDetailPosY = getUIItemPosY(uiItem: introTitleLabel)
        //Call this function
        let height = heightForUILabelView(text: itemData["intro"] ?? "", font: UIFont.systemFont(ofSize: 17), width: pageWidth-40)
        print(height)
        let introDetailLabel = UILabel(frame: CGRect(x: 20, y: introDetailPosY, width: pageWidth-40, height: height))
        introDetailLabel.textAlignment = .left
        introDetailLabel.textColor = UIColor .black
        introDetailLabel.font = UIFont.systemFont(ofSize: 17)
        introDetailLabel.numberOfLines = 0
        introDetailLabel.lineBreakMode = .byWordWrapping
        introDetailLabel.text = itemData["intro"]
        
        myScrollView.addSubview(introTitleLabel)
        myScrollView.addSubview(introDetailLabel)
        
        //设置  UIScrollView 的 contentSize : (width:注意设置为 ScreenWidth, height: 所有 subView's height 累加)
        myScrollView.contentSize = getUIScrollViewContentSize()
        print(myScrollView.contentSize)
        
    }
    
    func getUIItemPosY(uiItem:UIView) -> CGFloat {
        var posY = 0;
        posY = Int(uiItem.frame.origin.y + uiItem.frame.height + 15)
        return CGFloat(posY)
    }
    
    //To calculate height for label based on text size and width
    func heightForUILabelView(text:String, font:UIFont, width:CGFloat) -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
    func getUIScrollViewContentSize() -> CGSize {
        var contentRect = CGRect.zero
        for view in myScrollView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        return contentRect.size
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
