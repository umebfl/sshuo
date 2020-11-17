import UIKit

struct TabInfo {
    var controller: UIViewController
    var name: String
    var icon: String
    var actIcon: String
}

//class Main: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//    }
//}

let tabInfoList = [
    TabInfo(
        controller: Account(),
        name: "发现",
        icon: "bubble.left.and.bubble.right",
        actIcon: "bubble.left.and.bubble.right"),
    
    TabInfo(
        controller: Account(),
        name: "我的",
        icon: "book",
        actIcon: "book"),
    
    TabInfo(
        controller: Square(),
        name: "广场",
        icon: "cloud",
        actIcon: "cloud"),

    TabInfo(
        controller: Analy(),
        name: "状态",
        icon: "wand.and.stars",
        actIcon: "wand.and.stars"),

    TabInfo(
        controller: Account(),
        name: "账号",
        icon: "person",
        actIcon: "person")
]

class Main: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 广告页设置
        
        // 登录校验
        
        
//        for tabInfo in tabInfoList {
//            let nc = tabInfo.controller
//
//            let icon = UIImage(systemName: tabInfo.icon, withConfiguration: UIImage.SymbolConfiguration(weight: .thin))
//            // ?.withRenderingMode(.alwaysOriginal)
//
//            let actIcon = UIImage(systemName: tabInfo.actIcon, withConfiguration: UIImage.SymbolConfiguration(weight: .thin))
//
//            nc.tabBarItem = UITabBarItem.init(title: tabInfo.name, image: icon, selectedImage: actIcon)
//
//            nc.tabBarItem.setTitleTextAttributes([.foregroundColor: grayColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 9)], for: .normal)
//            nc.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.red], for: .selected)
//
//            self.addChild(nc)
//        }
//
//        self.tabBar.tintColor = grayColor
//        self.tabBar.isUserInteractionEnabled = true
    }

    
}
