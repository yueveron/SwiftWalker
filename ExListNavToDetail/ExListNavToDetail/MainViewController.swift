//
//  MainViewController.swift
//  ExListNavToDetail
//
//  Created by 8000 on 2018/11/29.
//  Copyright © 2018 Cross. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    /*
    var info = [
        ["萨内","京东安"],
        ["马内","萨拉赫","菲尔米诺"]
    ]
    
    let infoDictionary = [
        [
            ["name":"京东安","image":"man_0.jpg","intro":"伊尔卡伊·京多安（土耳其语：İlkay Gündoğan；1990年10月24日- ），是一名出生于德国工业城市盖尔森基兴的土耳其裔德国足球运动员，司职中场中路，现效力曼城，也是德国国家足球队球员。曾经效力过德甲球队波鸿以及纽伦堡，擅长中场组织与控制皮球。京多安也是2011/12赛季帮助多特蒙德获得德甲以及德国杯双冠王的主力中场。\n\n与前队友罗伊斯相同，实力出色但年纪轻轻便伤病史丰富，是足坛非常著名的玻璃人，使他在转会市场的身价并不漂亮。"],
            ["name":"萨内","image":"man_1.jpg","intro":"萨内在2016年8月加盟曼城，他出色的脚下技术和奔跑速度令他成为欧洲足坛的当红炸子鸡。\n\n在吸引多家豪门竞逐以后，他决定从德国来到英格兰继续发展。这名天才少年的多面手属性是他的最大优势。"]
        ],
        [
            ["name":"萨拉赫","image":"liv_0.jpg", "intro":"我在萨拉赫身上感受到了埃及之光，他是埃及的民族骄傲，是骄傲的象征。萨拉赫拥有令人叹为观止的冲刺速度，同时他总是能够发挥出自己在速度方面的优势。\n\n在比赛中，萨拉赫既能助攻队友得分，也能亲自摧城拔寨，他几乎无所不能 。"],
            ["name":"马内","image":"liv_1.jpg", "intro":"马内在南安普顿效力时就很出色，你可以从他的表现以及进球上看出他的能力。但自从来到利物浦，他又迈上了一个新的台阶。你必须称赞主教练以及教练组，还有马内自己，他为此付出了很多努力。\n\n马内已经很好地填补了拉希姆·斯特林留下的空缺。他不仅能在进攻区域内助攻队友，同时也能在射门方面发挥斯特林般的威胁作用。"],
            ["name":"菲尔米诺","image":"liv_2.jpg", "intro":"他总能够在比赛中保持轻松的心态，他的跑位以及把握机会能力都非常棒。\n\n他是一名非典型的巴西球员，他严格遵守纪律，有着巨大的自信心。当有人对他犯规时，他不会抱怨。他不是一个演员，只会站起来再投入战斗。"]
        ]
    ]
     */
    
    //定义二维数组,元素类型为 Dictionary<String, AnyObject>
    var jsonInfoDictionary = [[Dictionary<String, AnyObject>]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        initJsonData()
        //
        let fullScreenSize = UIScreen.main.bounds
        //
        self.title = "首页"
        self.navigationController?.navigationBar.isTranslucent = false
        
        //
        self.view.backgroundColor = UIColor.white
        //
        let myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height-64), style: .grouped)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        //
        myTableView.delegate = self
        myTableView.dataSource = self
        
        //
        myTableView.separatorStyle = .singleLine
        
        //
        myTableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        //
        myTableView.allowsSelection = true
        
        //
        myTableView.allowsMultipleSelection = false
        
        self.view.addSubview(myTableView)
        
        
    }
    
    func initJsonData(){
        //data 已经是 Dictionary 数据类型
        let data:Dictionary<String, AnyObject> = getJsonData()
        //all-sections
        jsonInfoDictionary = data["sections"] as! [[Dictionary<String, AnyObject>]]
    }
    
    
    //Dictionary<String, AnyObject> : 表示 key 是 String 类型，value 是 AnyObject, JSON必须使用是 AnyObjec
    func getJsonData() -> Dictionary<String, AnyObject> {
        var jsonData = Dictionary<String, AnyObject>()
        //Read JsonFile From bundle
        if let url = Bundle.main.url(forResource: "Data", withExtension: "bundle"), let bundle = Bundle(url: url) {
            if let path = bundle.path(forResource: "prj_data", ofType: "json"){
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    //jsonResult 转换为 Dictionary<String, AnyObject>
                    if let jsonResult = jsonResult as? Dictionary<String, AnyObject>{
                        jsonData = jsonResult
                    }
                } catch {
                }
            }
        }else{
            print("Invalid filename/path.")
        }
        return jsonData
    }
    
    //协议：有几组 section
    func numberOfSections(in tableView: UITableView) -> Int {
        return jsonInfoDictionary.count
    }
    
    //协议：每一组有几个 cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonInfoDictionary[section].count
    }
    
    //协议：每个 cell 显示的内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //取得 tableView 目前使用的 cell，此 cell 即为注册名为 "Cell" 的复用 cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        //
        if let myLabel = cell.textLabel {
            //each of section
            let section = jsonInfoDictionary[indexPath.section]
            //item inner each section
            let itemData = section[indexPath.row]
            let playerName = itemData["name"] as! String
            myLabel.text = playerName
        }
        return cell
    }
    
    //协议：点选 cell 后执行的动作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //each of section
        let section = jsonInfoDictionary[indexPath.section]
        //item inner each section
        let itemData = section[indexPath.row]
        //
        let detailViewController = DetailViewController()
        detailViewController.itemData = itemData as! [String : String] 
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    //协议：每个 section 的标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = section == 0 ? "曼城" : "利物浦"
        return title
    }
    
    
    
}
