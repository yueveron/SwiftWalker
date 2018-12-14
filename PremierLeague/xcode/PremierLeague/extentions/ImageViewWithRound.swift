// UIImageView 显示为圆形
import UIKit

extension UIImageView{
    func makeRounded(){
        let radius = self.frame.width*0.5
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
