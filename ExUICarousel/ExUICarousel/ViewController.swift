//
//  ViewController.swift
//  hangge_1314
//
//  Created by hangge on 2018/2/5.
//  Copyright © 2018年 hangge. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SliderGalleryControllerDelegate {
    
    //获取屏幕宽度
    let screenWidth =  UIScreen.main.bounds.size.width
    
    //图片轮播组件
    var sliderGallery : SliderGalleryController!
    
    //图片比例
    let IMAGE_RATIO : CGFloat = 0.5
    
    //图片集合
    //使用 URL
//    var images = ["http://img4q.duitang.com/uploads/item/201503/18/20150318230437_Pxnk3.jpeg",
//                  "http://img4.duitang.com/uploads/item/201501/31/20150131234424_WRJGa.jpeg",
//                  "http://img5.duitang.com/uploads/item/201502/11/20150211095858_nmRV8.jpeg",
//                  "http://cdnq.duitang.com/uploads/item/201506/11/20150611213132_HPecm.jpeg"]
    
    //使用 Assets.images
    var images = ["B_Silver_Player", "Sane_Player", "Gdongan_Player", "D_Silver_Player"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化图片轮播组件
        sliderGallery = SliderGalleryController()
        sliderGallery.delegate = self
        sliderGallery.view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: (screenWidth)*IMAGE_RATIO);
        
        //将图片轮播组件添加到当前视图
//        self.addChild(sliderGallery)
        self.view.addSubview(sliderGallery.view)
        
        //添加组件的点击事件
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTapAction(_:)))
        sliderGallery.view.addGestureRecognizer(tap)
    }
    
    //图片轮播组件协议方法：获取内部scrollView尺寸
    func galleryScrollerViewSize() -> CGSize {
        return CGSize(width: screenWidth, height: (screenWidth)*IMAGE_RATIO)
    }
    
    //图片轮播组件协议方法：获取数据集合
    func galleryDataSource() -> [String] {
        return images
    }
    
    //点击事件响应
    @objc func handleTapAction(_ tap:UITapGestureRecognizer)->Void{
        //获取图片索引值
        let index = sliderGallery.currentIndex
        //弹出索引信息
        let alertController = UIAlertController(title: "您点击的图片索引是：", message: "\(index)", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //“刷新数据”按钮点击
    @IBAction func reloadBtnTap(_ sender: AnyObject) {
        images = ["http://img3.duitang.com/uploads/item/201607/15/20160715160527_rSBfF.jpeg",
                  "http://d1.17xgame.com/d/wallpaper/2013/01/17/52549.jpg",
                  "http://p4.image.hiapk.com/uploads/allimg/140805/7730-140P5115S4.jpg"]
        sliderGallery.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

