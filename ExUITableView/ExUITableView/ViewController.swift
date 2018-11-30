//
//  ViewController.swift
//  ExUITableView
//
//  Created by 8000 on 2018/11/28.
//  Copyright © 2018 Cross. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var info = [
        ["萨内","京东安"],
        ["马内","萨拉赫","菲尔米诺"]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        let rect = self.view.frame
        //
        let myTableView = UITableView(frame: rect, style: .grouped)
        
        //注册 UITableViewCell, 标示 Cell 为后续重复使用的 Identifier
        //要先了解到當 cell 數量超過一個畫面可顯示時，目前存在的 cell 只有畫面上的這些(否則資料有成千上萬時，誰受得了)，當上下滑動時，
        //會隨顯示畫面的不同同時移出並加入 cell，這個動作不是一直建立新的 cell 而是會重複使用( reuse )，所以必須先註冊這個 reuse 的 cell ，辨識名稱設為"Cell"，來讓後續顯示時可以使用。
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
    
    //协议：有几组 section
    func numberOfSections(in tableView: UITableView) -> Int {
        return info.count
    }
    
    //协议：每一组有几个 cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info[section].count
    }
    
    //协议：每个 cell 显示的内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //取得 tableView 目前使用的 cell，此 cell 即为注册名为 "Cell" 的复用 cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        //
        /*
        if indexPath.section == 1{
            if indexPath.row == 0{
                cell.accessoryType = .checkmark
            }else if indexPath.row == 1 {
                cell.accessoryType = .detailButton
            }else if indexPath.row == 2 {
                cell.accessoryType = .detailDisclosureButton
            }else if indexPath.row == 3{
                cell.accessoryType = .disclosureIndicator
            }
        }
         */
        
        //
        if let myLabel = cell.textLabel {
            myLabel.text = "\(info[indexPath.section][indexPath.row])"
        }
        
        return cell
    }
    
    //协议：点选 cell 后执行的动作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let name = info[indexPath.section][indexPath.row]
        print("选择的是\(name)")
    }
    
    //协议：点选 Accessory 后按钮执行的动作
    //必须设置 cell 的 accessoryType
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath:IndexPath){
        let name = info[indexPath.section][indexPath.row]
        print("按下的是\(name)的detail")
    }
    
    //协议：每个 section 的标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = section == 0 ? "曼城" : "利物浦"
        return title
    }
    


}

