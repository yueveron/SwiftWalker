import WebKit
extension WKWebView{
    override open var safeAreaInsets: UIEdgeInsets{
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
