import UIKit

class UIReturnButton: UIButton {
    init() {
        super.init(frame: CGRect.zero)
        self.frame = CGRect(x: 5, y: 0, width: 46, height: 46)
        self.frame.origin.y += 40
        self.setImage(UIImage(named: "left-arrow"), for: .normal)
    }
    
    //继承 UIView 类，必须添加“必要初始化器”
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
