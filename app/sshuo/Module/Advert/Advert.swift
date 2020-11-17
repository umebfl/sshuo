import UIKit


// 是否第一次打开
let DEF_ADVERT_ISFIRSTOPEN = "ADVERT_ISFIRSTOPEN"
// 广告资源路径
let DEF_ADVERT_RESOURCESRC = "ADVERT_RESOURCESRC"
// 最后展示时间
let DEF_ADVERT_LASTSHOWTIME = "ADVERT_LASTSHOWTIME"


// 获取广告资源
fileprivate func fetchAdvertResource() {
    // 缓存广告资源到本地
    
    // 添加标记
    let useDef = UserDefaults.standard
    
    // 设置资源路径
    useDef.setValue("xxx", forKey: DEF_ADVERT_RESOURCESRC)
    // 设置资源更新时间
    
}

// 展示广告
fileprivate func showAdvertView(_ win: UIWindow) {
    // 打开广告页
    win.rootViewController = Advert()
    
    // 设置单日展示标记
//    var date = DateFormatter()
//    log.debug("date\(date.sting(from: Date()))")
    UserDefaults.standard.setValue("2020-20-20 11:00:00", forKey: DEF_ADVERT_LASTSHOWTIME)
    
}


func AdvertInit(_ win: UIWindow) {
    log.verbose("进入AdvertInit")

    // 存储数据
    let useDef = UserDefaults.standard

    // 第一次加载, 请求资源, 缓存资源
    // 已缓存资源, 打开广告页, 标记本日已展示广告, 请求资源更新, 缓存资源
    // 本日/本小时已展示广告
    // 资源已更新
    // 展示广告后, 如果势wifi环境, 则刷新广告资源
    // 挑战到广告页后, N秒/手动跳转到登录页/首页
    // 点击跳转到广告webview
    
    let isFirstOpen = useDef.bool(forKey: DEF_ADVERT_ISFIRSTOPEN)
    
    log.debug("isFirstOpen: \(isFirstOpen)")

    // 1. 第一次打开不显示广告
    // 2. 没有本地缓存不显示广告
    if(isFirstOpen) {
        log.verbose("初次打开app")
        // 请求资源
        
        // 更新状态
        useDef.setValue(false, forKey: DEF_ADVERT_ISFIRSTOPEN)
        
        // 跳转登录页逻辑
        HomeInit(win)
        return
    }
    
    // 第一次不显示 有没有图片
    if(true) {
        // 跳转到广告页
        showAdvertView(win)
    } else {
        // 执行加载
    }

    log.verbose("完成AdvertInit")
}

class Advert: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "banner")!)

        
    }
}
