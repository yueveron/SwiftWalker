//
//  CityCollectionViewCell.swift
//  PremierLeague
//
//  Created by 8000 on 2018/12/19.
//  Copyright © 2018 Cross. All rights reserved.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {
    var imageView:UIImageView!
    var titleLabel:UILabel!
    var gridUIView:UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let w:CGFloat = UIScreen.main.bounds.size.width
        //create : UIView
        let ratio:CGFloat = 12.0
        let gridWidth = w*0.5 - ratio*2
        gridUIView = UIView(frame:CGRect(x:0, y:0, width:gridWidth, height:gridWidth))
//        gridUIView.backgroundColor = UtilTools.hexStringToUIColor(hex: "ffffff")
        self.addSubview(gridUIView)
        
        // create : UIImageView
        let imageSize:CGFloat = gridWidth
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageSize, height: imageSize*0.8))
        imageView.image = UIImage(named: "city_london")
        imageView.contentMode = .scaleAspectFit
        //        imageView.makeRounded()
        gridUIView.addSubview(imageView)
        
        // create UILabel
        titleLabel = UILabel(frame:CGRect(x: 0, y: getUIItemPosY(uiItem: imageView)+0.5*ratio, width: gridUIView.frame.size.width, height: 20))
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight:.light)
        gridUIView.addSubview(titleLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setValueToCell(item: Dictionary<String, String>){
        titleLabel.text = item["name"]
        imageView.image = UIImage(named: item["image"] ?? "")
    }
    
    func getUIItemPosY(uiItem:UIView) -> CGFloat {
        var posY = 0;
        posY = Int(uiItem.frame.origin.y + uiItem.frame.height)
        return CGFloat(posY)
    }
}
