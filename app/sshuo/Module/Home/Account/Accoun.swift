import UIKit


class Account: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "账号"
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "banner")!)
        
        let img = UIImageView(image: UIImage(systemName: "person"))
        
        img.frame = CGRect(x: 100, y: 100,  width: 20, height: 20)
        
        self.view.addSubview(img)

    }
}
