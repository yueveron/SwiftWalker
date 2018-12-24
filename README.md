# Swift Walker
本项目是我学习 https://itisjoe.gitbooks.io/swiftgo/ 教程的笔记。

特别感谢翻页者，这是迄今为止看到最好的关于 Swift 入门教程！

---
###### Book : https://itisjoe.gitbooks.io/swiftgo/

### UIKit 初探
##### Cocoa Touch Class
- 继承了 UIKit 功能的 swift 文件
##### AppDelegate.swift 及 ViewController.swift
- AppDelegate.swift ：應用程式開啟時，會自AppDelegate.swift開始，這隻檔案負責應用程式的生命週期，像是啟動、閒置、進入後台、返回前台或是退出時要執行的動作。
- ViewController.swift : 應用程式預設的主要視圖(View)控制器(Controller)，所有需要的 UI 功能(像是按鈕、文字或圖案等等)，都必須在這個 ViewController 裡面建立，通常會寫在viewDidLoad()這個方法裡面。
- **Hint**
    - 一個 UIViewController 負責一個畫面(即呈現視圖View)的功能，如果有多個畫面時，就需要各自建立一個不同的 UIViewController。
---

### UIView
最基礎的一個元件：UIView，所有 UIKit 的元件(像是按鈕UIButton、文字UITextView等等)都是繼承自 UIView 。

要將元件放進視圖View中，需要了解有三個條件：
- 原點 (CGRect define)
- 尺寸 (CGRect define)
- 疊加上去的父視圖 (addSubview())

```
let pageWidth = stage.width
let pageHeight = stage.height

// 定義一個 UIView 的常數 名稱為 myView
// CGRect(x:,y:,width:,height:)來設定原點及尺寸。
let myView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
myView.backgroundColor = UIColor.blue

// UIView 另一個屬性center，這代表著這個元件的中心點位置，元件将会显示于舞台中心
myView.center = CGPoint(x: pageWidth/2, y: pageHeight/2)

// 將 myView 加入到 self.view
self.view.addSubview(myView)

// 将 myButton 加入到 myView
myView.addSubview(myButton)

```
定義一個 UIView 可以使用 **UIView(frame:)** 這個函式，函式的參數是一個 CGRect，CGRect就是由一個原點(x, y)及一個尺寸(width, height)組成，這行即定義了這個元件的原點與尺寸。 

---

### UIScrollView 具有Scroll功能的 UIView
當一個元件的實際視圖範圍比可見視圖範圍大時，會加上滑動條( scroll bar )讓使用者自由滑動，UIScrollView 就是有這一特性的最基本元件。實際上，前面章節介紹過的 ==UITextView 、 UITableView 及 UICollectionView 都是繼承自 UIScrollView== ，所以他們也都繼承了 UIScrollView 的特性。

###### Example : UIScrollView , 关键是设置 contentSize 的 width 及 height
```
import UIKit

class DetailViewController: UIViewController {
    let stage:CGRect = UIScreen.main.bounds
    var myScrollView : UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderUI()
    }
    
    func renderUI(){
        let pageWidth = stage.width
        let pageHeight = stage.height
        //* 创建： UIScrollView
        myScrollView = UIScrollView()
        myScrollView.frame = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight-84)
        myScrollView.isScrollEnabled = true
        self.view.addSubview(myScrollView);
        
        //* Add SubView To UIScrollView
        myScrollView.addSubview(nameLabel)
        myScrollView.addSubview(myImageView)
        myScrollView.addSubview(introDetailLabel)
        
        //* 关键：设置  UIScrollView 的 contentSize : (width:注意设置为 ScreenWidth, height: 所有 subView's height 累加)
        myScrollView.contentSize = getUIScrollViewContentSize()
        
    }
    
    func getUIScrollViewContentSize() -> CGSize {
        var contentRect = CGRect.zero
        for view in myScrollView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        return contentRect.size
    }
}
```

---

### 文字标签 UILabel
说明：文字标签：只显示文字，无交互事件

```
//计算：UILabel 包含文字内容后的 Height
let height = heightForUILabelView(text: itemData["intro"] ?? "", font: UIFont.systemFont(ofSize: 17), width: pageWidth-40)
let introDetailLabel = UILabel(frame: CGRect(x: 20, y: 20, width: pageWidth-40, height: height))
introDetailLabel.textAlignment = .left
introDetailLabel.textColor = UIColor .black
introDetailLabel.font = UIFont.systemFont(ofSize: 17)
introDetailLabel.numberOfLines = 0
introDetailLabel.lineBreakMode = .byWordWrapping
introDetailLabel.text = "非常长的语句...."
//
self.view.addSubview(introDetailLabel)

 //To calculate height for label based on text size and width
func heightForUILabelView(text:String, font:UIFont, width:CGFloat) -> CGFloat {
    let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.font = font
    label.text = text
    label.sizeToFit()
    return label.frame.height
}
    
```
---
### 文字输入 UITextField 及 UITextView
- UITextField ： 单行文本输入
- UITextView ：多行文本输入


```
//* UITextView
let myTextView = UITextView(frame: CGRect(x: 10, y: 50, width: 250, height: 200))
myTextView.textColor = UIColor.white
myTextView.backgroundColor = UIColor.lightGray
myTextView.textAlignment = .left
self.view.addSubview(myTextView)
```
---

### UIImage 及 UIImageView
说明：图片及图片容器

首先，你创建了 UIImage 实例(img)用于存放 image's data

```
NSString *sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"/picture.jpg"]; //assuming your image is in your app's bundle
UIImage *img = [[UIImage alloc]initWithContentsOfFile:sourcePath];
```

然后，你再创建一个 UIImageView 实例来将 UIImage的实例(img) 显示到 screen

```
[imageView1 setImage:img];  //assume you already create an instance of UIImageView named imageView1
```

--- 

### UIButton
说明：按钮，点击触发交互事件

```
override func viewDidLoad() {
    let myButton = UIButton.init(type: .custom)
    myButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
    myButton.setTitle("Like this video", for: .normal)
    myButton.layer.borderWidth = 5.0
    myButton.layer.borderColor = UIColor.white.cgColor
    myButton.backgroundColor = UIColor.black
    myButton.titleLabel?.textColor = UIColor.white
    myButton.tintColor = UIColor.white
    myButton.layer.cornerRadius = 15.0
    myButton.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
    myButton.tag = 1    //* 传参，只能传一个
}

//* Button Click Function
@objc func buttonClicked(_ button: UIButton) {
    let tag = button.tag
    print("Like this video is Clicked:\(tag)")
}

```

**addTarget**(target:, action:, forControlEvents:)這個方法，用來負責按下按鈕後的動作，這是由 UIControl 所提供的方法，再繼承給 UIButton。這個方法的參數說明如下：
- target：當事件發生時，要呼叫哪一個物件。
- action：呼叫的物件要執行的方法，以#selector()來指定，ViewController.clickButton指的就是ViewController類別的clickButton方法。將ViewController省略掉，只填入clickButton也可以。
- forControlEvents：觸發的事件。(這裡則是按下事件。)

**Hint**
- 觸控事件是由 UIControl 所負責的動作。 UIControl 是繼承自 UIView 的子類別，而這些需要觸控事件的元件則是再繼承自 UIControl ，除了 UIButton 之外，還有像是往後會學習到的 UISwitch、UISlider 都是。
- #selector()也可以填入需要參數的方法，像是clickButton(_:)或是clickButton(_:otherSender:)，請再另外定義這兩個不同的方法。請記得方法(以及函式)就算名稱一樣，參數不同的話也是代表不同的方法。更多函式說明請參考函式章節。
---

### UITableView
UITableView 常用的列表元件，每一個儲存格稱作一個 cell ，每個 cell 除了可以顯示文字外，還可以放置多個不同的元件。

继承：UITableView 继承自 UIScrollView。

###### Example

```
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
```

---

### UICollectionView 
UICollectionView 可以用來表現网格排列这种多行多列元件的样式。

**继承**：UITableView 继承自 UIScrollView。

**创建步骤：**
1. 定义呈现的样式 ：layout = UICollectionViewFlowLayout()
2. 创建 UICollectionView 实例 ：UICollectionView (frame: CGRect(), collectionViewLayout: layout)
3. UICollectionView 注册 cell ，以及设置代理
4. 拓展 ViewController : UICollectionViewDataSource , UICollectionViewDelegate。编写 cell 协议方法

***ViewController***
```
import UIKit

class TeamMainViewController: UIViewController {
    let stage:CGRect = UIScreen.main.bounds
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView(){
        //定义呈现的样式
        let layout = UICollectionViewFlowLayout()
        let ratio:CGFloat = 12
        //设置每一个 cell 与其他 cell 的间距
        layout.sectionInset = UIEdgeInsets(top: ratio, left: ratio, bottom: ratio, right: ratio)
        layout.minimumLineSpacing = ratio*2
        //设置 scrollDirection 滚动方向，如果横向滚动，还需要设置 UICollectionView 的 Height, 必须与 layout.itemSize 同高 
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
        self.view.addSubview(myCollectionView)
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
        cell.titleLabel.text = "Cell"
        return cell
    }
}

extension TeamMainViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("click:\(indexPath.row)")
    }
    
}

```

***UICollectionViewCell***

```
import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    var titleLabel:UILabel!
    var gridUIView:UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let w:CGFloat = UIScreen.main.bounds.size.width
        // create : UIView
        let ratio:CGFloat = 12.0
        // Set Cell-Size
        let gridWidth = w*0.5 - ratio*2
        gridUIView = UIView(frame:CGRect(x:0, y:0, width:gridWidth, height:gridWidth))
        self.addSubview(gridUIView)
        
        // create UILabel
        titleLabel = UILabel(frame:CGRect(x: 0, y: 0, width: gridUIView.frame.size.width, height: 20))
        gridUIView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setValueToCell(item: Dictionary<String, String>){
        titleLabel.text = item["name"]
    }
}

```




##### 进阶
###### Drag End Cell 缓动定位 : CollectionViewWithPaging-simplerExample-master
https://medium.com/@shaibalassiano/tutorial-horizontal-uicollectionview-with-paging-9421b479ee94

---
### 手动创建页面

**第一步**: 先以刪除檔案的方式將 Storyboard 刪除，也就是下圖中列表的這隻檔案 Main.storyboard ：
![image](4D72613D3D5445C1A7CE1FE03E8D3BDA)

**第二步**：接著看到 Info.plist ，找到並刪除 Main storyboard file base name 這個欄位。(按減號-就可以刪除了。)
![image](7DB3985677714139AE2595335D00EB32)

**第三步**：轉往到 AppDelegate.swift, 修改以下方法，手动创建 UIWindow 
```
import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // 建立一个 UIWindow : UIWindow 用于显示 App 内所有 View，iOS 下只有一个 Window, 就是 self.window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // 设置底色
        self.window?.backgroundColor = UIColor.white
        
        // 设置 “rootViewController” : 根视图控制器，也就是 App 启动后进入的第一个 View 所处的 ViewController
        self.window?.rootViewController = ViewController();
        
        // 将 UIWindow 设置为可见的，完成手动建立页面的步骤
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
```


---
### UINavigationController 导航控制器
导航控制器就像是一個容器，裡面可以用來放置各個頁面，畫面上方預設會有一個導覽列( Navigation Bar ) ，其中可以放置標題及按鈕，來切換或退出頁面。

![image](FF37C432B81F41DC894B237D8AECA266)

**第一步**：参考 ==手动创建页面==，建立 UIWindow，并且设置 rootViewController 为 NavigationController

```
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 建立一个 UIWindow : UIWindow 用于显示 App 内所有 View，iOS 下只有一个 Window, 就是 self.window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // 设置底色
        self.window?.backgroundColor = UIColor.white
        
        // 设置 “rootViewController” : 根视图控制器， 此处为 UINavigationController - 导航Controller (参数：App 首页ViewController)
        let nav = UINavigationController(rootViewController: ViewController())
        self.window?.rootViewController = nav;
        
        // 将 UIWindow 设置为可见的，完成手动建立页面的步骤
        self.window?.makeKeyAndVisible()
        
        return true
    }
}    
```

**第二步**：创建 ArticleViewController 及 SettingViewController 继承 UIViewController 的 Cocoa Touch Class 文件

**第三步**：在 ViewController 编写导航相关内容

**第四步**：编写 ArticleViewController 及 SettingViewController


##### ViewController 之间传递参数

###### SecondViewController : 标记接收参数的属性 selectedName

```
class ViewControllerB: UIViewController {
    var selectedName: String = "Anonymous"
}
```

###### MasterViewController : 向 SecondViewController 传递参数

```
let viewControllerB = ViewControllerB()
viewControllerB.selectedName = "Taylor Swift"
navigationController?.pushViewController(viewControllerB, animated: true)
```

##### 导航栏背景颜色及字体颜色或图片设置

```
// image : 输入 Image Literal , 点击图标，选择 Assets 库里的素材即可
let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
titleImageView.contentMode = .scaleAspectFit
navigationItem.titleView = titleImageView
// 背景颜色
self.navigationController?.navigationBar.barTintColor = UtilTools.hexStringToUIColor(hex: "#38003C")
// 字体颜色
let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
navigationController?.navigationBar.titleTextAttributes = textAttributes
//
self.navigationController?.navigationBar.isTranslucent = false
```


##### 导航栏进阶，参考
- 导航栏显示和隐藏的坑 ：https://www.jianshu.com/p/60e2369bbe0e
- https://stackoverflow.com/questions/29209453/how-to-hide-a-navigation-bar-from-first-viewcontroller-in-swift

---

### UITabBarController - 标签导航栏
也是一个导航容器，可以用來放置多個頁面，將可以前往的頁面以標籤列的方式列出。

這個範例的目標如下，有四個頁面可供切換，皆列在標籤列中：
![image](678E2F5278214E9790EC1D4310FD2961)

UITabBarController 本身并不会显示任何视图，如果要显示视图则必须设置其 viewControllers 属性（它默认显示 viewControllers[0]）。这个属性是一个数组，它维护了所有 UITabBarController 的子控制器。

为了尽可能减少视图之间的耦合，所有的 UITabBarController 的子控制器的相关标题、图标等信息均由子控制器自己控制，UITabBarController 仅仅作为一个容器存在。

#### UITabBarController 生命周期
1. 把子控制器都添加给 TabBarController 管理，当程序启动时它只会加载第一个添加的控制器的view。
2. 切换到第二个界面。先把第一个界面的view移开，再把新的view添加上去，但是第一个view只是被移开没有被销毁。
3. 重新切换到第一个界面，第一个的控制器直接 viewWillAppear，==不会再执行 viewDidLoad 方法。==。第二个界面中的 view 移除后并没有被销毁（因为它的控制器还存在，有一个强引用引用着它）
4. ==UINavigationController 通过栈来管理视图(之前的View会被销毁)，UITabBarController 通过数组来管理视图控(之前的View不会被销毁)。==

###### Example : 最简单的例子，ExUITabBarController
```
//  AppDelegate.swift

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        
        // 创建 UITabBarController - 标签导航栏视图控制器，UITabBarController 本身并不会显示任何 View, 如果要显示 View 必须设置其内的各自View 属性
        let myTabBar = UITabBarController()
        
        // 设置标签列
        // 使用 UITabBarController's tabBar 各个属性进行样式设置（背景图片、背景颜色、系统图标颜色等）
        myTabBar.tabBar.backgroundColor = UIColor.clear
        
        
        // 创建页面，使用系统自带样式
        // 所有的 UITabController 的子控制器的相关标题、图标等信息均由子控制器设置，例如：子控制器使用 tabBarItem 属性设置标题与图标
        let mainViewController = MainViewController()
        mainViewController.tabBarItem = UITabBarItem(tabBarSystemItem:.favorites, tag: 0)
        
        // 创建页面，使用自定义图片样式，有预设图片
        let articleViewController = ArticleViewController()
        articleViewController.tabBarItem = UITabBarItem(title: "文章", image: UIImage(named: "file"), tag: 1)
        
        let introViewController = IntroViewController()
        introViewController.tabBarItem = UITabBarItem(title: "介绍", image: UIImage(named: "profile"), tag: 2)
        
        let settingViewController = SettingViewController()
        settingViewController.tabBarItem.image = UIImage(named: "settings")
        settingViewController.tabBarItem.title = "设定"
        settingViewController.tabBarItem.tag = 3
        
        //子控制器加入到 UITabBarController
        myTabBar.viewControllers = [
            mainViewController,
            articleViewController,
            introViewController,
            settingViewController
        ]
        
        //预设开启的页面
        myTabBar.selectedIndex = 0
        
        //设置根视图控制器
        self.window?.rootViewController = myTabBar
        self.window?.makeKeyAndVisible()
        
        //
        return true
    }
}

```

**Hint**
- tarBarItem 图片大小，建议:3@-75X75
- https://www.flaticon.com/


#### 进阶，参考
- iOS常用UI控件-UITabBarController使用 ：https://www.jianshu.com/p/b934e6c52918
- 自定义 UITabBar 总结（一个模拟 instagram TabBar 的例子）：https://segmentfault.com/a/1190000004832987


---
### UIWebview - 内置浏览器
APP 中如果需要載入一些外部網站時，可以使用 UIWebView。 

```
import UIKit
import WebKit

class PlayerDetailViewController: UIViewController, WKNavigationDelegate {

    let stage:CGRect = UIScreen.main.bounds
    //
    var myWebView : WKWebView!
    var myLoadingIndicator:UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建 WebView
        myWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: stage.width, height: stage.height))
        
        //设置代理，进行 Loading 监测
        myWebView.navigationDelegate = self
        //
        self.view.addSubview(myWebView)
        
        //创建环状进度条
        myLoadingIndicator = UIActivityIndicatorView(style: .gray)
        myLoadingIndicator.center = CGPoint(x: stage.width*0.5, y: stage.height*0.5)
        self.view.addSubview(myLoadingIndicator)
        
        //读取网址
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
    }
}

```

---

### UIViewController的生命周期

https://juejin.im/post/5a706cf05188257323357286

-整个控制器声明周期：  viewDidLoad -> viewWillAppear -> viewWillLayoutSubviews -> viewDidLayoutSubviews ->  viewDidAppear -> viewWillDisappear -> viewDidDisappear
