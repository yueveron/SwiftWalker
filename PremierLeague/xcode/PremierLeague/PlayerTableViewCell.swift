
import UIKit

class PlayerTableViewCell: UITableViewCell {
    var showImageView : UIImageView!
    var numberLabel : UILabel!
    var positionLabel : UILabel!
    var nameLabel : UILabel!
    //
    let PADDING_TOP:CGFloat = 20
    let stage:CGRect = UIScreen.main.bounds
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    func setupUI(){
        let ITEM_HEIGHT:CGFloat = 70.0
        showImageView = UIImageView(frame: CGRect(x: 0, y: PADDING_TOP, width: ITEM_HEIGHT, height: ITEM_HEIGHT))
        showImageView.layer.masksToBounds = true
        showImageView.contentMode = .scaleAspectFit
        self.addSubview(showImageView)
        //
        let textWidth:CGFloat = stage.width-showImageView.frame.width-20
        let textUIView = UIView(frame: CGRect(x: showImageView.frame.width + 20, y: PADDING_TOP, width: textWidth, height: ITEM_HEIGHT))
        self.addSubview(textUIView)
        numberLabel = UILabel(frame: CGRect(x: 0, y: 15, width: 25, height: 20))
        numberLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        numberLabel.textColor = UIColor.black
        textUIView.addSubview(numberLabel)
        //
        nameLabel = UILabel(frame: CGRect(x: numberLabel.frame.width + 15, y: 15, width: textWidth, height: 20))
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        nameLabel.textAlignment = .left
        nameLabel.textColor = UIColor.black
        textUIView.addSubview(nameLabel)
        //
        positionLabel = UILabel(frame: CGRect(x: nameLabel.frame.origin.x, y: nameLabel.frame.origin.y + 20, width: textWidth, height: 20))
        positionLabel.font = UIFont.systemFont(ofSize: 14)
        positionLabel.textAlignment = .left
        positionLabel.textColor = UIColor.black
        textUIView.addSubview(positionLabel)
        //
        let arrowUIImageView = UIImageView(frame: CGRect(x: stage.width-65, y: 40, width: 20, height: 20))
        arrowUIImageView.contentMode = .scaleAspectFit
        arrowUIImageView.image = UIImage(named: "icon_right-arrow")
        self.addSubview(arrowUIImageView)
    }
    
    func setValueToCell(item: Dictionary<String, String>){
        numberLabel.text = item["number"]
        nameLabel.text = item["name"]
        positionLabel.text = item["position"]
        showImageView.image = UIImage(named: item["image"] ?? "")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
