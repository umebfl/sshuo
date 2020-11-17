import UIKit
import SwiftMoment
import SnapKit

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

// 广告展示时间
let ADVERT_DURATION = 3
// 自动跳转延迟时间
let ADVERT_JUMP_DURATION = -1

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
fileprivate func showAdvertView() {
    log.verbose("展示广告")
    
    let advertView = Advert()

    // 打开广告页
    let navView = UINavigationController(rootViewController: advertView)
//    navVIew.isNavigationBarHidden = true
    navView.navigationController?.setNavigationBarHidden(true, animated: true)
    
    rootWindow.rootViewController = navView
    
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
func AdvertInit() {
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
        HomeInit()
        return
    } else if(checkAdvertHasCache()) {

        if(!checkAdvertShowLate() == false) {
            showAdvertView()
            return
        }
        
        HomeInit()
        return
    } else {
        // 请求资源
        fetchAdvertResource()
        // 跳转登录页逻辑
        HomeInit()
        return
    }
}

// 点击页面 跳转到webview页面
// 显示倒计时
// 延迟3秒后, 可点击关闭按钮, 调用登录逻辑

class Advert: UIViewController {
    
    var timer = Timer()
    let bgView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    // 已经跳转到详情页
    var isJumpToAdvertDetail = false
    
    
    
    @objc func jumpToAdvertDetail() {
        
//        self.timer.invalidate()

        isJumpToAdvertDetail = true
        
        log.verbose("跳转到广告详情页")
        self.navigationController?.pushViewController(AdvertDetail(), animated: true)
    }

    @objc func jumpToHomeInit() {
        
        self.timer.invalidate()

        log.verbose("跳转到HomeInit")
        HomeInit()
    }
    
    func BuildAdvertView() {

        let sview = self.view!
        
        var duration = ADVERT_DURATION

        let tipsLab = UILabel()
        let numLab = UILabel()
        let jumpBtn = UIButton()
        
        let src = UserDefaults.standard.string(forKey: DEF_ADVERT_RESOURCESRC)

        bgView.image = UIImage(named: src ?? "Advert1")

        sview.addSubview(bgView)
        sview.addSubview(tipsLab)
        sview.addSubview(jumpBtn)
        sview.addSubview(numLab)
        
        tipsLab.text = I18n("广告")
        tipsLab.backgroundColor = depAp3Color
        tipsLab.textColor = UIColor.white
        tipsLab.font = UIFont.boldSystemFont(ofSize: 10)
        tipsLab.textAlignment = NSTextAlignment.center
        tipsLab.snp.makeConstraints { make in
            make.top.equalTo(sview).inset(52)
            make.right.equalTo(sview).inset(18)
            make.size.equalTo(CGSize(width: 26, height: 14))
        }

        jumpBtn.setTitle(I18n("跳过") + " |  ", for: .normal)
        jumpBtn.backgroundColor = depAp3Color
        jumpBtn.setTitleColor(UIColor.white, for: .normal)
    //    jumpBtn.setTitleColor(lightAp2Color, for: .highlighted)
        jumpBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        jumpBtn.layer.cornerRadius = 15
        jumpBtn.snp.makeConstraints { make in
            make.bottom.equalTo(sview).inset(96)
            make.right.equalTo(sview).inset(12)
            make.size.equalTo(CGSize(width: 72, height: 30))
        }
        
        numLab.text = String(duration)
        numLab.textColor = UIColor.white
        numLab.font = UIFont.boldSystemFont(ofSize: 12)
        numLab.snp.makeConstraints { make in
            make.bottom.equalTo(sview).inset(104)
            make.right.equalTo(sview).inset(18)
            make.size.equalTo(CGSize(width: 12, height: 12))
        }

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in

            duration -= 1

            numLab.text = String(duration >= 0 ? duration : 0)

            if(duration <= 0) {
                jumpBtn.backgroundColor = depAp5Color
                // 绑定跳转事件, 提供手动跳转
                jumpBtn.addTarget(self, action: #selector(self.jumpToHomeInit), for: .touchUpInside)
            }
            
            // 延迟2秒跳转
            if(duration < ADVERT_JUMP_DURATION) {
                self.timer.invalidate()
                
                if(self.isJumpToAdvertDetail == false) {
                    // 自动跳转到登录逻辑
                    self.jumpToHomeInit()
                }
            }
        })
        
        // 图片绑定跳转事件
        let singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(jumpToAdvertDetail))
        bgView.addGestureRecognizer(singleTapGesture)
        bgView.isUserInteractionEnabled = true
    }
 
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        log.verbose("打开广告页")

        BuildAdvertView()
    }
}


