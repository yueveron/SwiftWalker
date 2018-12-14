//
//  ViewController.swift
//  PremierLeague
//
//  Created by 8000 on 2018/12/6.
//  Copyright © 2018 Cross. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SliderGalleryControllerDelegate {
    let stage:CGRect = UIScreen.main.bounds
    let PADDING:CGFloat = 12.0
    let TINT_COLOR:UIColor = UIColor.init(red: 24/255, green: 24/255, blue: 24/255, alpha: 1.0)
    let TITLE_SIZE:CGFloat = 18.0
    let BLOCK_MARGIN:CGFloat = 36.0
    //
    var pageUIScrollView : UIScrollView!
    //图片轮播组件
    var sliderGallery : SliderGalleryController!
    //轮播图片比例
    let IMAGE_RATIO : CGFloat = 0.5
    //轮播片集合
    var carouselImages = ["B_Silver_Player", "Sane_Player", "Gdongan_Player", "D_Silver_Player"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        setupNavBarStyles()
        //
        self.view.backgroundColor = UtilTools.hexStringToUIColor(hex: "#F7F8FA") // hexStringToUIColor(hex: "#F7F8FA")
        //
        pageUIScrollView = UIScrollView()
        pageUIScrollView.frame = CGRect(x: 0, y: 0, width: stage.width, height: stage.height-84)
        pageUIScrollView.isScrollEnabled = true
        self.view.addSubview(pageUIScrollView);
        //
        let yCarouselItem = setCarouselItem()
        //Team Label
        let teamTitleLabel = UIPaddingLabel(withInsets: 0, 0, PADDING, PADDING)
        teamTitleLabel.frame = CGRect(x: 0, y: yCarouselItem + BLOCK_MARGIN, width: stage.width, height: 20)
        teamTitleLabel.textAlignment = .center
        teamTitleLabel.textColor = TINT_COLOR
        teamTitleLabel.font = UIFont.systemFont(ofSize: CGFloat(TITLE_SIZE))
        teamTitleLabel.text = "英超六霸"
        pageUIScrollView.addSubview(teamTitleLabel)
        
        //Teams Buttons
        let yTeamsButtons = getUIItemPosY(uiItem: teamTitleLabel) + 10
        let yCityTitleLabel = setTeamsButtons(initPosY: yTeamsButtons) + 10
        
        //Citys Label
        let cityTitleLabel = UIPaddingLabel(withInsets: 0, 0, PADDING, PADDING)
        cityTitleLabel.frame = CGRect(x: 0, y: yCityTitleLabel, width: stage.width, height: 20)
        cityTitleLabel.textAlignment = .center
        cityTitleLabel.textColor = TINT_COLOR
        cityTitleLabel.font = UIFont.systemFont(ofSize: CGFloat(TITLE_SIZE))
//        cityTitleLabel.backgroundColor = UIColor.lightGray
        cityTitleLabel.numberOfLines = 0
        cityTitleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        cityTitleLabel.text = "英伦城市"
        pageUIScrollView.addSubview(cityTitleLabel)
        //
        pageUIScrollView.contentSize = getUIScrollViewContentSize()
        
        // UIButton
//        let myButtonPlayer = UIReturnButton()
//        myButtonPlayer.addTarget(self, action: #selector(buttonClickedPlayer(_:)), for: .touchUpInside)
//        self.view.addSubview(myButtonPlayer)
    }
   
    
    func setTeamsButtons(initPosY:CGFloat) -> CGFloat{
//        print("set Teams Buttons")
//        let arrImages = ["team_spur", "team_manc", "team_arsnel", "team_manu", "team_liverpool", "team_chelse"]
        let arrTeams:Array<Dictionary<String, String>> = [
            ["image":"team_spur", "title":"热刺"],
            ["image":"team_manc", "title":"曼城"],
            ["image":"team_arsnel", "title":"阿森纳"],
            ["image":"team_manu", "title":"曼联"],
            ["image":"team_liverpool", "title":"利物浦"],
            ["image":"team_chelse", "title":"切尔西"]
        ]
        let arrLength = arrTeams.count
        let buttonWidth:CGFloat = 75
        let buttonHeight:CGFloat = 75
        let col:Int = 3
        var row:Int = 0
        //设置按钮的间距
        let hMargin:CGFloat = (stage.width - (CGFloat(col)*buttonWidth)) / (CGFloat(col+1))
        let vMargin:CGFloat = 20.0
        //
        let buttonGroupHeight:CGFloat = (buttonHeight + vMargin) * CGFloat(arrLength/col)
        let buttonGroupView = UIView(frame: CGRect(x: 0, y: initPosY, width: stage.width, height: buttonGroupHeight))
//        buttonGroupView.backgroundColor = UIColor.lightGray
        pageUIScrollView.addSubview(buttonGroupView)
        //
        let attr = [
            NSAttributedString.Key.font:UIFont.systemFont(ofSize: CGFloat(14)),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        //
        for index in 0..<arrLength {
            var button : UIButton!
            var image : UIImage!
            button = UIButton()
            let imageName : String = arrTeams[index]["image"]!
            let teamName : String = arrTeams[index]["title"]!
            let title = NSAttributedString(string: teamName, attributes: attr)
            image = UIImage(named: "\(imageName)")
//            button.setImage(image, for: .normal)
            //
            if index%col == 0 && index>=col{
                row += 1
            }
            //
            let x:CGFloat = hMargin + (buttonWidth + hMargin) * CGFloat(index%col)
            let y:CGFloat = (buttonHeight + vMargin) * CGFloat(row)
            //print("x:\(x) , y:\(y)")
            button.frame = CGRect(x: x, y: y, width: buttonWidth, height: buttonHeight)
//            button.backgroundColor = UIColor.red
            button.set(image: image, attributedTitle: title, at: .bottom, width: 15.0, state: .normal)
            //
            button.addTarget(self, action: #selector(clkToTeam(_:)), for: .touchUpInside)
            button.tag = index    //* 传参，只能传一个
            //
            buttonGroupView.addSubview(button)
        }
        //
        let itemPosY:CGFloat = getUIItemPosY(uiItem: buttonGroupView)
        return itemPosY
    }
    
    func setCarouselItem() -> CGFloat{
        //初始化图片轮播组件
        sliderGallery = SliderGalleryController()
        sliderGallery.delegate = self
        sliderGallery.view.frame = CGRect(x: 0, y: 0, width: stage.width, height: (stage.width)*IMAGE_RATIO);
        
        //添加组件的点击事件
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTapAction(_:)))
        sliderGallery.view.addGestureRecognizer(tap)
        
        //将图片轮播组件添加到当前视图
        pageUIScrollView.addSubview(sliderGallery.view)
        let itemPosY:CGFloat = getUIItemPosY(uiItem: sliderGallery.view)
        return itemPosY
    }
    
    func getUIItemPosY(uiItem:UIView) -> CGFloat {
        var posY = 0;
        posY = Int(uiItem.frame.origin.y + uiItem.frame.height)
        return CGFloat(posY)
    }
    
    func getUIScrollViewContentSize() -> CGSize {
        var contentRect = CGRect.zero
        for view in pageUIScrollView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        return contentRect.size
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        //
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func setupNavBarStyles(){
        // image : 输入 Image Literal , 点击图标，选择 Assets 库里的素材即可
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        //
        self.navigationController?.navigationBar.barTintColor = UtilTools.hexStringToUIColor(hex: "#38003C")
        //
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    //* Button Click Function
    @objc func clkToTeam(_ button: UIButton) {
//        let tag = button.tag
        let teamDetailViewController = TeamDetailViewController()
        //传参给 articleViewController
//        teamDetailViewController.passInfo = "首页"
        //
        self.navigationController?.pushViewController(teamDetailViewController, animated: true)
        //显示导航栏
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //* Button Click Function
    @objc func buttonClickedPlayer(_ button: UIButton) {
        let playerDetailViewController = PlayerDetailViewController()
        self.navigationController?.pushViewController(playerDetailViewController, animated: true)
    }
    
    //Mark 图片轮播组建协议
    //图片轮播组件协议方法：获取内部scrollView尺寸
    func galleryScrollerViewSize() -> CGSize {
        return CGSize(width: stage.width, height: (stage.width)*IMAGE_RATIO)
    }
    
    //图片轮播组件协议方法：获取数据集合
    func galleryDataSource() -> [String] {
        return carouselImages
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
    
}

