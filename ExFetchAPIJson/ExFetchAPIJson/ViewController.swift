//
//  ViewController.swift
//  ExFetchAPIJson
//
//  Created by 8000 on 2018/12/5.
//  Copyright © 2018 Cross. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDelegate, URLSessionDownloadDelegate {
    var dataUrl : String = "http://veron.tirozhang.com/api/push.php"
    
    //Create LocalStoreFile - hotel.json, and return file-URL
    var hotelURL: URL = {
        do {
            return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("hotel.json")
        } catch {
            fatalError("Error getting hotel URL from document directory.")
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.simpleGet(dataUrl, targetURL: hotelURL)
        
        self.normalGet(dataUrl)
        
    }
    
    // Basic : get Api Method - 功能单纯的读取 API 方法
    func simpleGet(_ myUrl :String, targetURL :URL) {
        URLSession.shared.dataTask(with: URL(string: myUrl)!, completionHandler: {data, response, error in
            do {
//                print(String(data: data!, encoding: .utf8))
                //data : 获取的 API 数据，write() 将 data 写入到 hotel.json 本地文件
                try data?.write(to: targetURL, options: .atomic)
                print("simpleGet：Save Success")
//                self.jsonParse(targetURL)
            } catch {
                print("simpleGet：Save Fail")
            }
            
        }).resume()
    }
    
    // Update : get Api Method - 功能增强的读取 API 方法
    func normalGet(_ myUrl :String) {
        if let url = URL(string: myUrl) {
            // 設置為預設的 session 設定
            let sessionWithConfigure = URLSessionConfiguration.default
            
            // 設置委任對象
            let session = URLSession(configuration: sessionWithConfigure, delegate: self, delegateQueue: nil)
            
            // 設置遠端 API 網址
            let dataTask = session.downloadTask(with: url)
            
            // 執行動作
            dataTask.resume()
        }
    }
    
    //处理解析后的 Json 数据
    func setDictData(dict:Dictionary<String, AnyObject>){
        let keyData = dict["data"] as! Dictionary<String, AnyObject>
        print("prjname : \(keyData["prjname"]!)")
        let listSections = keyData["sections"] as! [AnyObject]
        for item in listSections {
            var dicItem = item as! Dictionary<String,String>
            print(dicItem["name"]!)
        }
    }
    
    // MARK: URLSessionDownloadDelegate Methods
    
    // 监听下载完成
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("下载完成")
        do {
            let data = try? Data(contentsOf: location)
//            print(String(data: data!, encoding: .utf8))
            try data?.write(to: hotelURL, options: .atomic)
//            print("normalGet: Success")
            //
            self.setDictData(dict: self.jsonParse(url: hotelURL))
        } catch {
            print("normalGet: Fail")
        }
        
    }
    
    // 监听下载进行中
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        // 如果 totalBytesExpectedToWrite 一直為 -1 ,表示遠端主機未提供完整檔案大小資訊
        print("下载进度： \(totalBytesWritten)/\(totalBytesExpectedToWrite)")
    }
    
    //获得 JsonDictionary : Dictionary<String, AnyObject> 表示 key 是 String 类型，value 是 AnyObject, JSON必须使用是 AnyObjec
    func jsonParse(url:URL) -> Dictionary<String, AnyObject> {
        var jsonData = Dictionary<String, AnyObject>()
        do {
            let data = try Data(contentsOf: url)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
//            print(jsonResult)
            //jsonResult 转换为 Dictionary<String, AnyObject>
            if let jsonResult = jsonResult as? Dictionary<String, AnyObject>{
                jsonData = jsonResult
            }
        } catch {
            print("解析 json 失敗")
        }
        return jsonData
    }
}

