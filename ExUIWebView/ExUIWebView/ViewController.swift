//
//  ViewController.swift
//  ExUIWebView
//
//  Created by 8000 on 2018/12/14.
//  Copyright © 2018 Cross. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    let stage = UIScreen.main.bounds.size
    //
    var myWebView : WKWebView!
    var myLoadingIndicator:UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //创建 WebView
        myWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: stage.width, height: stage.height))
        
        //设置代理，实行 Loading 监测
        myWebView.navigationDelegate = self
        
        //
        self.view.addSubview(myWebView)
        
        //创建环状进度条
        myLoadingIndicator = UIActivityIndicatorView(style: .gray)
        myLoadingIndicator.center = CGPoint(x: stage.width*0.5, y: stage.height*0.5)
        self.view.addSubview(myLoadingIndicator)
        
        //读取一次网址
        let url:String = "http://cn.mancity.com/teams/profile/leroy-sane"
        self.go(url: url)
    }
    
    func go(url:String){
        let urlTarget = URL(string: url)
        let urlRequest = URLRequest(url: urlTarget!)
        myWebView.load(urlRequest)
    }
    
    // 读取网址开始，显示进度条
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        myLoadingIndicator.startAnimating()
    }
    
    //读取网址完毕，隐藏进度条
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myLoadingIndicator.stopAnimating()
        //
        print(myWebView.url?.absoluteString ?? "")
    }

}

