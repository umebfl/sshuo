import UIKit
import SwiftMoment

// 是否第一次打开
let DEF_ADVERT_ISFIRSTOPEN = "ADVERT_ISFIRSTOPEN"
// 广告资源路径
let DEF_ADVERT_RESOURCESRC = "ADVERT_RESOURCESRC"
// 广告资源更新时间
let DEF_ADVERT_RESOURCEUPDATETIME = "ADVERT_RESOURCEUPDATETIME"
// 最后展示时间
let DEF_ADVERT_LASTSHOWTIME = "ADVERT_LASTSHOWTIME"
// 请求广告资源次数
let DEF_ADVERT_FETCHCOUNT = "DEF_ADVERT_FETCHCOUNT"


// 获取广告资源
fileprivate func fetchAdvertResource() {
    // 请求广告资源
    
    // 缓存广告资源到本地
    
    // 添加标记
    let useDef = UserDefaults.standard
    
    let fetchCount = UserDefaults.standard.integer(forKey: DEF_ADVERT_FETCHCOUNT)

    // 设置资源路径
    useDef.setValue("Advert\(fetchCount % 4 + 1)", forKey: DEF_ADVERT_RESOURCESRC)
    // 设置资源更新时间
    useDef.setValue(moment().format("YYYY-MM-dd"), forKey: DEF_ADVERT_RESOURCEUPDATETIME)
    // 设置请求计数
    useDef.setValue(fetchCount + 1, forKey: DEF_ADVERT_FETCHCOUNT)

    log.verbose("获取广告资源 count: \(fetchCount)")
}

// 展示广告
fileprivate func showAdvertView(_ win: UIWindow) {
    log.verbose("展示广告")
    // 打开广告页
    win.rootViewController = Advert()
    
    // 设置单日展示标记
    let now = moment()
    UserDefaults.standard.setValue(
        [now.year, now.month, now.day, now.hour, now.minute, now.second],
        forKey: DEF_ADVERT_LASTSHOWTIME)
    
    // 更新资源
    fetchAdvertResource()
}

// 检测最近是否已经展示过广告
fileprivate func checkAdvertShowLate() -> Bool {
    // 最后一次打开时间
    let lastShowTime = UserDefaults.standard.array(forKey: DEF_ADVERT_LASTSHOWTIME)
    
    if(lastShowTime == nil) {
        return false
    }

    let last = moment(lastShowTime as? [Int] ?? [])
    let now = moment()

    let duration = now.intervalSince(last!)

    log.debug("时间差: \(String(describing: lastShowTime)) to \(now.format("YYYY-MM-dd HH:mm:ss")) = \(duration.hours)小时")
    
    log.verbose("检测最近是否已经展示过广告: \(duration.hours < 1 ? "是" : "不是")")

    // 设置每日一次
    // 设置每小时一次(使用策略)
    if(duration.hours < 1) {
        return true
    }

    // 需要显示
    return false
}

// 检测是否是第一次打开
fileprivate func checkAdvertIsFirstOpen() -> Bool {
    
    let isFirstOpen = UserDefaults.standard.bool(forKey: DEF_ADVERT_ISFIRSTOPEN)

    log.verbose("检测是否是第一次打开: \(isFirstOpen ? "是" : "不是")")
    return isFirstOpen
}

// 检测缓存是否存在
fileprivate func checkAdvertHasCache() -> Bool {

    let src = UserDefaults.standard.string(forKey: DEF_ADVERT_RESOURCESRC)
    let rv = src != nil

    log.verbose("检测缓存是否存在: \(rv ? "存在" : "不存在") : \(String(describing: src)))")
    return rv
}



// 第一次加载, 请求资源, 缓存资源
// 已缓存资源, 打开广告页, 标记本日已展示广告, 请求资源更新, 缓存资源
// 本日/本小时已展示广告
// 资源已更新
// 展示广告后, 如果势wifi环境, 则刷新广告资源
// 挑战到广告页后, N秒/手动跳转到登录页/首页
// 点击跳转到广告webview
func AdvertInit(_ win: UIWindow) {
    log.verbose("进入AdvertInit")

    // 跳过广告页场景:
    // 1. 第一次打开不显示广告
    // 2. 没有本地缓存不显示广告
    // 3. 最近已经打开过广告
    // 4. 会员去广告
    if(checkAdvertIsFirstOpen()) {
        log.verbose("第一次打开不显示广告")
        // 请求资源
        fetchAdvertResource()

        // 更新状态
        UserDefaults.standard.setValue(false, forKey: DEF_ADVERT_ISFIRSTOPEN)
        
        // 跳转登录页逻辑
        HomeInit(win)
        return
    } else if(checkAdvertHasCache()) {

        if(!checkAdvertShowLate() == false) {
            showAdvertView(win)
            return
        }
        
        HomeInit(win)
        return
    } else {
        // 请求资源
        fetchAdvertResource()
        // 跳转登录页逻辑
        HomeInit(win)
        return
    }
}

// 点击页面 跳转到webview页面
// 显示倒计时
// 延迟3秒后, 可点击关闭按钮, 调用登录逻辑

class Advert: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        log.verbose("打开广告页")

        self.view.addSubview(BuildAdvertView())
    }
}

func BuildAdvertView() -> UIView {

    let Container = UIView()

//    let tipsLab = UILabel()
//    let jumpBtn = UIButton()
//    
////        let src = UserDefaults.standard.string(forKey: DEF_ADVERT_RESOURCESRC)
//
//    let bgView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
//
////    bgView.image = UIImage(named: "Advert4")
////    
////    Container.addSubview(bgView)
////    
////    tipsLab.text = "广告"
////    tipsLab.textColor = ""
////    tipsLab.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
////    Container.addSubview(tipsLab)
////    
////    
////    jumpBtn.titleLabel = "跳过"
////    Container.addSubview(jumpBtn)

    return Container
    
}
