//
//  ViewController.swift
//  ExUICollectionView
//
//  Created by 8000 on 2018/12/17.
//  Copyright © 2018 Cross. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var stage : CGSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        //
        setupCollectionView()
        
        
    }
    
    func setupCollectionView(){
        //定义呈现的样式
        let layout = UICollectionViewFlowLayout()
        let ratio:CGFloat = 6
        //设置每一个 cell 与其他 cell 的间距
        layout.sectionInset = UIEdgeInsets(top: ratio, left: ratio, bottom: ratio, right: ratio)
        layout.minimumLineSpacing = ratio*2
        //设置 cell size
        layout.itemSize = CGSize(width: CGFloat(stage.width*0.5-ratio*3), height: CGFloat(stage.width*0.5-ratio*3))
        
        //创建 UICollectionView 实例
        let myCollectionView = UICollectionView(frame: CGRect(x: ratio, y: 20, width: stage.width-ratio*2, height: stage.height-20), collectionViewLayout: layout)
        //Set UICollectionView Background-Color
        myCollectionView.backgroundColor = UIColor.white
        
        //注册 cell 已供后续使用
        myCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        //设置代理
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        //
        
        //
        self.view.addSubview(myCollectionView)
    }
    
    
}

extension ViewController : UICollectionViewDataSource{
    //每一个 section 内 cell 的个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    //每个 cell 要显示的内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"Cell", for: indexPath) as! CustomCollectionViewCell
        // 設置 cell 內容 (即自定義元件裡 增加的圖片與文字元件
        cell.imageView.image = UIImage(named: "0\(indexPath.item + 1)")
        cell.titleLabel.text = "Cell"
        return cell
    }
}

extension ViewController : UICollectionViewDelegate {
    //协议：点选 cell 后执行的动作
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("click:\(indexPath.row)")
    }
    
}

