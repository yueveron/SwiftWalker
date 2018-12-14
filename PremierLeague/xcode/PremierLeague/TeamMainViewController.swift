import UIKit

class TeamMainViewController: UIViewController {
    let stage:CGRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //
        self.title = "球队"
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        
        //
        let myLabel = UILabel(frame: CGRect(x: 0, y: 20, width: stage.width, height: 20))
        myLabel.textAlignment = .center
        myLabel.textColor = UIColor .blue
        myLabel.font = UIFont.systemFont(ofSize: 17)
        myLabel.text = "Team Main Page"
        self.view.addSubview(myLabel)
        //
        let myButton = UIButton.init(type: .custom)
        myButton.frame = CGRect(x: 20, y: 50, width: 100, height: 50)
        myButton.setTitle("曼城", for: .normal)
        myButton.layer.borderWidth = 5.0
        myButton.layer.borderColor = UIColor.white.cgColor
        myButton.backgroundColor = UIColor.black
        myButton.titleLabel?.textColor = UIColor.white
        myButton.tintColor = UIColor.white
        myButton.layer.cornerRadius = 15.0
        myButton.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        self.view.addSubview(myButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        //
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
    //* Button Click Function
    @objc func buttonClicked(_ button: UIButton) {
        let teamDetailViewController = TeamDetailViewController()
        self.navigationController?.pushViewController(teamDetailViewController, animated: true)
    }
    

}
