import UIKit
import WebKit

class PlayerDetailViewController: UIViewController, WKNavigationDelegate {

    let stage:CGRect = UIScreen.main.bounds
    //
    var myWebView : WKWebView!
    var myLoadingIndicator:UIActivityIndicatorView!
    //PlayerUrl : get from parent viewcontroller
    var playerUrl : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建 WebView
        myWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: stage.width, height: stage.height))
        
        //        myWebView.contentInsetAdjustmentBehavior = .never
        
        //设置代理，实行 Loading 监测
        myWebView.navigationDelegate = self
        
        //
        self.view.addSubview(myWebView)
        
        //创建环状进度条
        myLoadingIndicator = UIActivityIndicatorView(style: .gray)
        myLoadingIndicator.center = CGPoint(x: stage.width*0.5, y: stage.height*0.5)
        self.view.addSubview(myLoadingIndicator)
        
        //读取一次网址
//        playerUrl = "http://cn.mancity.com/teams/profile/leroy-sane"
        self.go(url: playerUrl)
        
        setupPageCommon()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        //
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
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
    
    func setupPageCommon(){
        self.view.backgroundColor = UIColor.lightGray
        self.navigationController?.navigationBar.isTranslucent = true
        
        // button-return
        let myReturnButton = UIReturnButton()
        myReturnButton.addTarget(self, action: #selector(buttonClickedReturn(_:)), for: .touchUpInside)
        self.view.addSubview(myReturnButton)
        
    }
    
    //* Button Click Function
    @objc func buttonClickedReturn(_ button: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    

}
