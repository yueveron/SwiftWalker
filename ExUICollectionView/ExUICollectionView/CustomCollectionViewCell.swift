
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    var imageView:UIImageView!
    var titleLabel:UILabel!
    var gridUIView:UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let w:CGFloat = UIScreen.main.bounds.size.width
        //create : UIView
        let ratio:CGFloat = 6.0
        let gridWidth = w*0.5 - ratio*3
        gridUIView = UIView(frame:CGRect(x:0, y:0, width:gridWidth, height:gridWidth))
        gridUIView.backgroundColor = UIColor.lightGray
        self.addSubview(gridUIView)
        
        // create : UIImageView
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: gridUIView.frame.size.width, height: gridUIView.frame.size.height))
        gridUIView.addSubview(imageView)
        
        // create UILabel
        titleLabel = UILabel(frame:CGRect(x: 0, y: 0, width: gridUIView.frame.size.width, height: 40))
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.orange
        gridUIView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
