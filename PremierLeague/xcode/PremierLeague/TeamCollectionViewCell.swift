//
//  TeamCollectionViewCell.swift
//  PremierLeague
//
//  Created by 8000 on 2018/12/17.
//  Copyright © 2018 Cross. All rights reserved.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    var imageView:UIImageView!
    var titleLabel:UILabel!
    var stadiumLabel:UILabel!
    var gridUIView:UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let w:CGFloat = UIScreen.main.bounds.size.width
        //create : UIView
        let ratio:CGFloat = 12.0
        let gridWidth = w*0.5 - ratio*2
        gridUIView = UIView(frame:CGRect(x:0, y:0, width:gridWidth, height:gridWidth))
//        gridUIView.backgroundColor = UtilTools.hexStringToUIColor(hex: "0054A6")
        self.addSubview(gridUIView)
        
        // create : UIImageView
        let imageSize:CGFloat = 60.0
        let imageXPos:CGFloat = CGFloat((gridUIView.frame.size.width-imageSize)*0.5)
        imageView = UIImageView(frame: CGRect(x: imageXPos, y: 12.0, width: imageSize, height: imageSize))
//        imageView.makeRounded()
        gridUIView.addSubview(imageView)
        
        // create UILabel
        titleLabel = UILabel(frame:CGRect(x: 0, y: getUIItemPosY(uiItem: imageView)+1.5*ratio, width: gridUIView.frame.size.width, height: 20))
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight:.bold)
        gridUIView.addSubview(titleLabel)
        
        stadiumLabel = UILabel(frame: CGRect(x: 0, y: getUIItemPosY(uiItem: titleLabel)+ratio, width: gridUIView.frame.size.width, height: 15))
        stadiumLabel.textAlignment = .center
        stadiumLabel.textColor = UIColor.white
        stadiumLabel.font = UIFont.systemFont(ofSize: 14)
        gridUIView.addSubview(stadiumLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setValueToCell(item: Dictionary<String, String>){
        let color = item["color"]
        if item["font"] == "dark"{
            titleLabel.textColor = UIColor.black
            stadiumLabel.textColor = UIColor.black
        }
        gridUIView.backgroundColor = UtilTools.hexStringToUIColor(hex: "\(color ?? "ffffff")")
        titleLabel.text = item["name"]
        stadiumLabel.text = item["stadium"]
        imageView.image = UIImage(named: item["image"] ?? "")
    }
    
    func getUIItemPosY(uiItem:UIView) -> CGFloat {
        var posY = 0;
        posY = Int(uiItem.frame.origin.y + uiItem.frame.height)
        return CGFloat(posY)
    }
}
