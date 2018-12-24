
import UIKit

class CityMainViewController: UIViewController {
    let stage = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // create UILabel
        let titleLabel = UILabel(frame:CGRect(x: 0, y: 0, width: stage.width, height: stage.height))
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight:.light)
        titleLabel.text = "页面建设中"
        self.view.addSubview(titleLabel)
    }
    

}
