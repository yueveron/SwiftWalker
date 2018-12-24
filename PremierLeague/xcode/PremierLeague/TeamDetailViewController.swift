import UIKit

class TeamDetailViewController: UIViewController {
    let stage:CGRect = UIScreen.main.bounds
    let RATIO_BANNER:CGFloat = 0.4
    let BLOCK_MARGIN:CGFloat = 30
    let PADDING:CGFloat = 15
    var INSET_WIDTH:CGFloat = 0
    //
    var pageUIScrollView : UIScrollView!
    var playerTableView : UITableView!
    //
    var teamDatas:Dictionary<String, AnyObject> = [
        "bannerImage":"banner_manc" as AnyObject,
        "logoImage":"logo_manc" as AnyObject,
        "name":"Manchester City" as AnyObject,
        "intro":"曼彻斯特城足球俱乐部是一间位于曼彻斯特的足球俱乐部，前身为成立于1880年的“圣马可的西戈登”的足球队，1894年改名为“曼城”，目前于英格兰超级联赛比赛。球队主场为阿提哈德球场。\n\n2011/12赛季，曼城拿得英超赛冠奖，时隔44年终于重新获得英格兰顶级联赛冠军，2013/14赛季时隔一年后再度重夺英格兰顶级联赛冠军及联赛杯冠军成为“双冠王”。2017/18年度赛季，曼城第三次夺得英超冠军，并打破英超最高得分及最多进球等多项纪录。" as AnyObject,
        "soulImage":"soul_manc" as AnyObject,
        "soulMsg":"瓜迪奥拉\n“不管是赢球还是输球，我都会坚持我所信仰的踢法”" as AnyObject,
        "playerDatas" : [
            ["name":"埃德森","image":"manc_p_31_ederson","position":"守门员","number":"31", "url":"http://cn.mancity.com/teams/profile/ederson-moraes"],
            ["name":"萨内","image":"manc_p_19_Sane","position":"左边前位","number":"19", "url":"http://cn.mancity.com/teams/profile/leroy-sane"],
            ["name":"贝尔纳多·席尔瓦","image":"manc_p_20_BSilver","position":"进攻中场","number":"20", "url":"http://cn.mancity.com/teams/profile/bernardo-silva"]
        ] as AnyObject
    ]
    var playerDatas = [Dictionary<String, String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        INSET_WIDTH = stage.width - 2*PADDING
        setupPageCommon()
        // Banner Image
        let yPosHeader = setupBanner() + BLOCK_MARGIN
        // Header Logo Title
        let yPosIntro = setupHeader(yPos: yPosHeader) + BLOCK_MARGIN
        //Intro
        let yPosSoul = setupIntro(yPos: yPosIntro) + BLOCK_MARGIN
        //Soul
        let yPosPlayerList = setupSoul(yPos: yPosSoul) + BLOCK_MARGIN
        //PlayerList
        let yPosTable = setupPlayerListLabel(yPos: yPosPlayerList)
        //
        setupTable(yPos: yPosTable+PADDING)
        
        return
    }
    
    func setupPlayerListLabel(yPos:CGFloat) -> CGFloat{
        let playerListLabel = SMIconLabel(frame:CGRect(x: PADDING, y: yPos, width: INSET_WIDTH, height: 20))
        playerListLabel.textAlignment = .left
        playerListLabel.text = "球队阵容"
        playerListLabel.icon = UIImage(named: "icon_list")
        playerListLabel.iconPadding = 20
        playerListLabel.iconPosition = (.left, .top)
        playerListLabel.textColor = UIColor.white
        playerListLabel.font = UIFont.systemFont(ofSize: 17, weight:.bold)
        pageUIScrollView.addSubview(playerListLabel)
        return getUIItemPosY(uiItem: playerListLabel)
    }
    
    func setupTable(yPos:CGFloat){
//        playerDatas = [
//            ["name":"埃德森","image":"manc_p_31_ederson","position":"守门员","number":"31", "url":"http://cn.mancity.com/teams/profile/ederson-moraes"],
//            ["name":"萨内","image":"manc_p_19_Sane","position":"左边前位","number":"19", "url":"http://cn.mancity.com/teams/profile/leroy-sane"],
//            ["name":"贝尔纳多·席尔瓦","image":"manc_p_20_BSilver","position":"进攻中场","number":"20", "url":"http://cn.mancity.com/teams/profile/bernardo-silva"]
//        ]
        playerDatas = teamDatas["playerDatas"] as! [Dictionary<String, String>]
        playerTableView = UITableView(frame: CGRect(x: PADDING, y: yPos, width: INSET_WIDTH, height: 0), style: .plain)
        playerTableView.isScrollEnabled = false
        //设置 table's row height : 必须同时设置 rowHeight 及 estimatedRowHeigth(预估高度，决定 UITableView's ContentSize)
        playerTableView.rowHeight = 90
        playerTableView.estimatedRowHeight = 90
        //设置 row 分割线占满屏幕两端
        playerTableView.layoutMargins = UIEdgeInsets.zero
        playerTableView.separatorInset = UIEdgeInsets.zero
        //
        playerTableView.delegate = self
        playerTableView.dataSource = self
        //
        playerTableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: "Cell")
        //
        pageUIScrollView.addSubview(playerTableView)
    }
    
    func setupBanner() -> CGFloat{
        let bannerImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: stage.width, height: stage.width*RATIO_BANNER))
        bannerImageView.contentMode = .scaleAspectFill
        bannerImageView.image = UIImage(named: teamDatas["bannerImage"] as! String)
        pageUIScrollView.addSubview(bannerImageView)
        return getUIItemPosY(uiItem: bannerImageView)
    }
    
    func setupHeader(yPos:CGFloat) -> CGFloat {
        let headerView = UIView(frame: CGRect(x: PADDING, y: yPos, width: INSET_WIDTH, height: 100))
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = UIImage(named: teamDatas["logoImage"] as! String)
        //
        let teamTitleLabel = UIPaddingLabel(withInsets: 0, 0, 0, 0)
        teamTitleLabel.frame = CGRect(x: 120, y: 0, width: INSET_WIDTH-120, height: 100)
        teamTitleLabel.textAlignment = .left
        teamTitleLabel.textColor = UIColor.white
        teamTitleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        teamTitleLabel.text = teamDatas["name"] as? String
        //
        headerView.addSubview(teamTitleLabel)
        headerView.addSubview(logoImageView)
        pageUIScrollView.addSubview(headerView)
        return getUIItemPosY(uiItem: headerView)
    }
    
    func setupIntro(yPos:CGFloat) -> CGFloat {
        let introTitleLabel = UIPaddingLabel(withInsets: 0, 0, 0, 0)
        introTitleLabel.frame = CGRect(x: PADDING, y: yPos, width: INSET_WIDTH, height: 17)
        introTitleLabel.textAlignment = .left
        introTitleLabel.textColor = UIColor.white
        introTitleLabel.font = UIFont.systemFont(ofSize: 17, weight:.bold)
        introTitleLabel.text = "球队简介"
        pageUIScrollView.addSubview(introTitleLabel)
        //计算：UILabel 包含文字内容后的 Height
        let strText:String = teamDatas["intro"] as! String
        let introDetailLabel = UIMultiLineLabel(text: strText, font: UIFont.systemFont(ofSize: 16), lineSpacing: 8.0, frame: CGRect(x: PADDING, y: yPos+BLOCK_MARGIN, width: INSET_WIDTH, height: 0))
        introDetailLabel.textColor = UIColor.white
        pageUIScrollView.addSubview(introDetailLabel)
        return getUIItemPosY(uiItem: introDetailLabel)
    }
    
    func setupSoul(yPos:CGFloat) -> CGFloat {
        let soulVIew = UIView(frame: CGRect(x: PADDING, y: yPos, width: INSET_WIDTH, height: 96))
        soulVIew.backgroundColor = UtilTools.hexStringToUIColor(hex: "4297d7")
        soulVIew.layer.cornerRadius = 10
        //
        let soulImageView = UIImageView(frame: CGRect(x: 15, y: 10, width: 80, height: 80))
        soulImageView.contentMode = .scaleAspectFill
        soulImageView.image = UIImage(named: teamDatas["soulImage"] as! String)
        soulImageView.makeRounded()
        soulVIew.addSubview(soulImageView)
        //
        let strText:String = teamDatas["soulMsg"] as! String
        let soulLabel = UIMultiLineLabel(text: strText, font: UIFont.systemFont(ofSize: 18), lineSpacing: 6.0, frame: CGRect(x: (15+80+15), y: 10, width: (INSET_WIDTH-15-15-80-15), height: 80))
        soulLabel.textColor = UIColor.white
        soulVIew.addSubview(soulLabel)
        pageUIScrollView.addSubview(soulVIew)
        //
        return getUIItemPosY(uiItem: soulVIew)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        //
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //Set : UITableView Full Height
        playerTableView.frame.size = playerTableView.contentSize
        //Set : UIScrollView Full Height
        let fixedContenSize:CGSize!
        fixedContenSize = getUIScrollViewContentSize()
        fixedContenSize.height = fixedContenSize.height + BLOCK_MARGIN
        pageUIScrollView.contentSize = fixedContenSize
    }
    
    func setupPageCommon(){
        self.view.backgroundColor = UtilTools.hexStringToUIColor(hex: "#6caee0")
        self.navigationController?.navigationBar.isTranslucent = true
        
        //
        pageUIScrollView = UIScrollView()
        //关键：禁止调整 scroll view insets，使 UIScrillView 即使在 iphoneX 也能居顶部
        pageUIScrollView.contentInsetAdjustmentBehavior = .never
        pageUIScrollView.frame = CGRect(x: 0, y: 0, width: stage.width, height: stage.height)
        pageUIScrollView.isScrollEnabled = true
//        pageUIScrollView.backgroundColor = UIColor.lightGray
        self.view.addSubview(pageUIScrollView);
        
        // button-return
        let myReturnButton = UIReturnButton()
        myReturnButton.addTarget(self, action: #selector(buttonClickedReturn(_:)), for: .touchUpInside)
        self.view.addSubview(myReturnButton)
        
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
    
    //* Button Click Function
    @objc func buttonClickedPlayer(_ button: UIButton) {
        let playerDetailViewController = PlayerDetailViewController()
        self.navigationController?.pushViewController(playerDetailViewController, animated: true)
    }
    
    //* Button Click Function
    @objc func buttonClickedReturn(_ button: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}



extension TeamDetailViewController : UITableViewDataSource{
    //协议：有几组 section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //协议：每一组有几个 cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerDatas.count
    }
    
    //协议：每个 cell 显示的内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //取得 tableView 目前使用的 cell，此 cell 即为注册名为 "Cell" 的复用 cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PlayerTableViewCell
        //
        let itemData:Dictionary<String, String> = playerDatas[indexPath.row]
        cell.setValueToCell(item: itemData)
        return cell
    }
    
}

extension TeamDetailViewController : UITableViewDelegate {
    //协议：点选 cell 后执行的动作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("click:\(indexPath.row)")
        let playerDetailViewController = PlayerDetailViewController()
        let itemData:Dictionary<String, String> = playerDatas[indexPath.row]
        playerDetailViewController.playerUrl = itemData["url"]!
        self.navigationController?.pushViewController(playerDetailViewController, animated: true)
    }
}
