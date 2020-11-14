//
//  MineView.swift
//  sshuo
//
//  Created by ume on 2020/11/13.
//

import SwiftUI
import UIKit


struct MineView: View {

    @Environment(\.colorScheme) var cs

    var body: some View {
        
        ScrollView {
            VStack() {
                
                ButtomItem(text: "创作者中心", icon: "wand.and.rays")
                ButtomDanger(text: "退出登录")

            }

        }
        .padding()
        .background(
            Rectangle()
                .fill(theme(cs).viewD1L2)
        )
    }
    
}

struct MineView_Previews: PreviewProvider {
    static var previews: some View {
        MineView()
    }
}
