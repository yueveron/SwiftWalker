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
    //CityData
    var cityDatas = [Dictionary<String, String>]()
    
    //
    let listTeamsDeatilData : Array<Dictionary<String, AnyObject>> = ProjectData.getAllTeamsDetailData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        setupNavBarStyles()
        //
        self.view.backgroundColor = UtilTools.hexStringToUIColor(hex: "#F7F8FA") // hexStringToUIColor(hex: "#F7F8FA")
        //
        pageUIScrollView = UIScrollView()
        pageUIScrollView.frame = CGRect(x: 0, y: 0, width: stage.width, height: stage.height-120)
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
        let yCityCV = getUIItemPosY(uiItem: cityTitleLabel) + 10
        setupCityCollectionView(initPosY: yCityCV)
        //
        pageUIScrollView.contentSize = getUIScrollViewContentSize()
        
        // UIButton
//        let myButtonPlayer = UIReturnButton()
//        myButtonPlayer.addTarget(self, action: #selector(buttonClickedPlayer(_:)), for: .touchUpInside)
//        self.view.addSubview(myButtonPlayer)
    }
   
    func setupCityCollectionView(initPosY:CGFloat){
        cityDatas = [
            ["name":"伦敦", "image":"city_london","index":"0"],
            ["name":"曼切斯特", "image":"city_manchester","index":"1"],
            ["name":"利物浦", "image":"city_liverpool","index":"2"],
            ["name":"莱斯特", "image":"city_leicester","index":"3"]
        ]
        //定义呈现的样式
        let layout = UICollectionViewFlowLayout()
        let ratio:CGFloat = PADDING
        //设置滚动方向
        layout.scrollDirection = .horizontal
        //设置每一个 cell 与其他 cell 的间距
        layout.sectionInset = UIEdgeInsets(top: 0, left: ratio, bottom: 0, right: ratio)
        layout.minimumLineSpacing = ratio
        //设置 cell size
        let sizeW = CGFloat(stage.width*0.5-ratio*2)
        layout.itemSize = CGSize(width: sizeW, height: sizeW)
        
        //创建 UICollectionView 实例
        let myCollectionView = UICollectionView(frame: CGRect(x:0, y: initPosY, width: stage.width, height: sizeW), collectionViewLayout: layout)
        //Set UICollectionView Background-Color
        myCollectionView.backgroundColor = UtilTools.hexStringToUIColor(hex: "#F7F8FA")
        myCollectionView.showsHorizontalScrollIndicator = false
        
        //注册 cell 已供后续使用
        myCollectionView.register(CityCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        //设置代理
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        //
        pageUIScrollView.addSubview(myCollectionView)
    }
    
    func setTeamsButtons(initPosY:CGFloat) -> CGFloat{
//        print("set Teams Buttons")
//        let arrImages = ["team_spur", "team_manc", "team_arsnel", "team_manu", "team_liverpool", "team_chelse"]
        let arrTeams:Array<Dictionary<String, String>> = [
            ["image":"team_spur", "title":"热刺", "index":"0"],
            ["image":"team_manc", "title":"曼城", "index":"1"],
            ["image":"team_arsnel", "title":"阿森纳", "index":"2"],
            ["image":"team_manu", "title":"曼联", "index":"3"],
            ["image":"team_liverpool", "title":"利物浦", "index":"4"],
            ["image":"team_chelse", "title":"切尔西", "index":"5"]
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
            button.tag = Int(arrTeams[index]["index"] ?? "0")!   //* 传参，只能传一个
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
        self.navigationController?.navigationBar.isTranslucent = false
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
        var index:Int = button.tag
        if index>1 {index=1}
        let teamDetailViewController = TeamDetailViewController()
        //传参给 push-ViewController
        teamDetailViewController.teamDatas = listTeamsDeatilData[index]
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
        let playerDatas : [Dictionary<String, String>] = [
            ["name":"贝尔纳多·席尔瓦", "url":"http://cn.mancity.com/teams/profile/bernardo-silva"],
            ["name":"萨内", "url":"http://cn.mancity.com/teams/profile/leroy-sane"],
            ["name":"京东安","url":"http://cn.mancity.com/teams/profile/ilkay-gundogan"],
            ["name":"大卫·席尔瓦","url":"http://cn.mancity.com/teams/profile/david-silva"]
        ]
        //
        let playerDetailViewController = PlayerDetailViewController()
        let itemData:Dictionary<String, String> = playerDatas[index]
        playerDetailViewController.playerUrl = itemData["url"]!
        self.navigationController?.pushViewController(playerDetailViewController, animated: true)
        //弹出索引信息
//        let alertController = UIAlertController(title: "您点击的图片索引是：", message: "\(index)", preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
//        alertController.addAction(cancelAction)
//        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension ViewController : UICollectionViewDataSource{
    //每一个 section 内 cell 的个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityDatas.count
    }
    
    //每个 cell 要显示的内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"Cell", for: indexPath) as! CityCollectionViewCell
        //
        let itemData:Dictionary<String, String> = cityDatas[indexPath.item]
        cell.setValueToCell(item: itemData)
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
