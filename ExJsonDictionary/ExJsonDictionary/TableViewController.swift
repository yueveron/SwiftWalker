//
//  TableViewController.swift
//  ExJsonDictionary
//
//  Created by 8000 on 2018/12/3.
//  Copyright © 2018 Cross. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var jsonInfoDictionary = [[Dictionary<String, AnyObject>]]()

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initJsonData()
        
        //
        let fullScreenSize = UIScreen.main.bounds
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
        let data:Dictionary<String, AnyObject> = getJsonData()
        //all-sections
        jsonInfoDictionary = data["sections"] as! [[Dictionary<String, AnyObject>]]
    }
    
    //Get Dictionary of Json(获得JsonData, 将其赋值给 Dictionary) : Dictionary<String, AnyObject> : 表示 key 是 String 类型，value 是 AnyObject, JSON必须使用是 AnyObjec
    func getJsonData() -> Dictionary<String, AnyObject> {
        var jsonDictionary = Dictionary<String, AnyObject>()
        //Read JsonFile From bundle
        if let url = Bundle.main.url(forResource: "Data", withExtension: "bundle"), let bundle = Bundle(url: url) {
            if let path = bundle.path(forResource: "prj_data", ofType: "json"){
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    //jsonResult 转换为 Dictionary<String, AnyObject>
                    if let jsonResult = jsonResult as? Dictionary<String, AnyObject>{
                        jsonDictionary = jsonResult
                    }
                } catch {
                }
            }
        }else{
            print("Invalid filename/path.")
        }
        return jsonDictionary
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

}
