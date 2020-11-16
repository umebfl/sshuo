//
//  AccountView.swift
//  sshuo
//
//  Created by ume on 2020/11/13.
//

import SwiftUI


struct AccountView: View {

    @Environment(\.colorScheme) var cs
 
    func yesAction() {
        print("确定")
    }
    
    func test() {
        print(123)
    }
    
    
    var body: some View {
        ScrollView {
            VStack() {
                ButtomItem(text: "创作者中心", icon: "wand.and.rays")
                
                BlockList(
                    title: "其他",
                    listData: [
                        ["title": "设置", "icon": "cube", "msg": ""],
                        ["title": "夜间模式", "icon": "moon.stars", "msg": ""],
                        ["title": "个性装扮", "icon": "paintbrush", "msg": ""],
                        ["title": "黑名单", "icon": "slash.circle", "msg": ""]
                    ]
                )
                
                BlockList(
                    listData: [
                        ["title": "帮助与反馈", "icon": "questionmark.circle", "msg": ""],
                        ["title": "我的订单", "icon": "doc.text", "msg": ""],
                        ["title": "分享说说", "icon": "arrow.up.right.circle", "msg": ""],
                        ["title": "关于", "icon": "exclamationmark.circle", "msg": ""]
                    ]
                )
                
                ButtomDanger(
                    text: "退出登录",
                    alertTitle: "说说",
                    alertMessage: "确定退出当前账号吗?",
                    yesAction: yesAction
                )
            }
            .padding()
            .padding(.bottom)
        }
        .modifier(ModuleViewModifier())
    }
    
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
