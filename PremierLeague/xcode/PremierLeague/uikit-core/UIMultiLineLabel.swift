import UIKit

class UIMultiLineLabel: UILabel {

    init(text:String, font:UIFont, lineSpacing:CGFloat, frame:CGRect) {
        super.init(frame: CGRect.zero)
        let lableHeight = heightForUILabelView(text: text, font: font, width: frame.width, lineSpacing: lineSpacing)
        self.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: lableHeight)
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.alignment = .justified
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
        self.sizeToFit()
    }
    
    //继承 UIView 类，必须添加“必要初始化器”
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //To calculate height for label based on text size and width ： 根据字数，计算获得 UILable 高度
    func heightForUILabelView(text:String, font:UIFont, width:CGFloat, lineSpacing:CGFloat) -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        //
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.alignment = .justified
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        label.attributedText = attributedString
        //
        label.sizeToFit()
        //
        return label.frame.height
    }

}
