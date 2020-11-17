import UIKit


// 是否第一次打开
let ADVERT_ISFIRSTOPEN = "AdvertIsFirstOpen"

func AdvertInit(_ win: UIWindow) {

    // 存储数据
    let useDef = UserDefaults.standard
    
    // 第一次加载, 请求资源, 缓存资源
    // 已缓存资源, 打开广告页, 标记本日已展示广告, 请求资源更新, 缓存资源
    // 本日/本小时已展示广告
    // 资源已更新
    // 展示广告后, 如果势wifi环境, 则刷新广告资源
    // 挑战到广告页后, N秒/手动跳转到登录页/首页
    // 点击跳转到广告webview
    
    
    let isFirstOpen = useDef.bool(forKey: ADVERT_ISFIRSTOPEN)
    
    print(isFirstOpen)

    // 1. 第一次打开不显示广告
    // 2. 没有本地缓存不显示广告
    if(isFirstOpen) {
        // 请求资源
        
        // 更新状态
        useDef.setValue(false, forKey: ADVERT_ISFIRSTOPEN)
        
        // 跳转登录页逻辑
        HomeInit(win)
        return
    }
    
    // 第一次不显示 有没有图片
    if(true) {
        // 跳转到广告页
        win.rootViewController = Advert()
    } else {
        // 执行加载
    }

}

class Advert: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "banner")!)

        
    }
}
