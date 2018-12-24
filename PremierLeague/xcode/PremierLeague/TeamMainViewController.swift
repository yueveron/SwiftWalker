import UIKit

class TeamMainViewController: UIViewController {
    let stage:CGRect = UIScreen.main.bounds
    var teamDatas = [Dictionary<String, String>]()
    //
    let listTeamsDetailData : Array<Dictionary<String, AnyObject>> = ProjectData.getAllTeamsDetailData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        self.view.backgroundColor = UtilTools.hexStringToUIColor(hex: "#F7F8FA")
        setupNavBarStyles()
        //
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        //
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func setupCollectionView(){
        teamDatas = [
            ["name":"热刺","color":"EEEEEE", "font":"dark", "image":"team_spur","stadium":"白鹿巷球场","index":"0"],
            ["name":"曼城","color":"0054A6", "font":"light","image":"team_manc","stadium":"伊蒂哈德球场","index":"1"],
            ["name":"阿森纳","color":"fe0002","font":"light","image":"team_arsnel","stadium":"酋长球场","index":"2"],
            ["name":"曼联","color":"#DA1921","font":"light","image":"team_manu","stadium":"老特拉福德","index":"3"],
            ["name":"利物浦","color":"E31B26","font":"light","image":"team_liverpool","stadium":"安菲尔德","index":"4"],
            ["name":"切尔西","color":"0a4595","font":"light","image":"team_chelse","stadium":"斯坦福桥","index":"5"],
            ["name":"埃佛顿","color":"00369c","font":"light","image":"team_manc","stadium":"古迪逊公园","index":"6"],
            ["name":"莱斯特","color":"273e8a","font":"light","image":"team_manc","stadium":"国王球场","index":"7"]
        ]
        //定义呈现的样式
        let layout = UICollectionViewFlowLayout()
        let ratio:CGFloat = 12
        //设置每一个 cell 与其他 cell 的间距
        layout.sectionInset = UIEdgeInsets(top: ratio, left: ratio, bottom: ratio, right: ratio)
        layout.minimumLineSpacing = ratio*2
        layout.scrollDirection = .vertical  //.horizontal
        //设置 cell size
        layout.itemSize = CGSize(width: CGFloat(stage.width*0.5-ratio*2), height: CGFloat(stage.width*0.5-ratio*2))
        
        //创建 UICollectionView 实例
        let myCollectionView = UICollectionView(frame: CGRect(x:0, y: 0, width: stage.width, height: stage.height-120), collectionViewLayout: layout)
        //Set UICollectionView Background-Color
        myCollectionView.backgroundColor = UtilTools.hexStringToUIColor(hex: "#F7F8FA")
        //Set Shows VerticalScrollIndicator
        myCollectionView.showsVerticalScrollIndicator = true
        //注册 cell 已供后续使用
        myCollectionView.register(TeamCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        //设置代理
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        //
        
        //
        self.view.addSubview(myCollectionView)
    }
    
    
    func setupNavBarStyles(){
        self.title = "球队"
        //
        self.navigationController?.navigationBar.barTintColor = UtilTools.hexStringToUIColor(hex: "#38003C")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        //
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
}

extension TeamMainViewController : UICollectionViewDataSource{
    //每一个 section 内 cell 的个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamDatas.count
    }
    
    //每个 cell 要显示的内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"Cell", for: indexPath) as! TeamCollectionViewCell
        //
//        cell.imageView.image = UIImage(named: "0\(indexPath.item + 1)")
        let itemData:Dictionary<String, String> = teamDatas[indexPath.item]
//        cell.titleLabel.text = itemData["name"]
        cell.setValueToCell(item: itemData)
        return cell
    }
}

extension TeamMainViewController : UICollectionViewDelegate {
    //协议：点选 cell 后执行的动作
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("click:\(indexPath.row)")
        //
        let teamDetailViewController = TeamDetailViewController()
        //传参给 push-ViewController
        let itemData:Dictionary<String, String> = teamDatas[indexPath.item]
        var index = Int(itemData["index"] ?? "0") ?? 0
        if index>1 {index=1}
        teamDetailViewController.teamDatas = listTeamsDetailData[index]
        self.navigationController?.pushViewController(teamDetailViewController, animated: true)
    }
    
}
