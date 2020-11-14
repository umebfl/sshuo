//
//  Buttom.swift
//  sshuo
//
//  Created by ume on 2020/11/15.
//

import SwiftUI


import SwiftUI

struct ButtomDanger: View {
    
    @Environment(\.colorScheme) var cs
    
    var text: String
    
    var body: some View {
        Button(action: {
            print("退出登录")
        }){
            HStack() {
                Spacer()
                Text(text)
                    .font(.system(size: 18))
                Spacer()
            }
            .frame(height: 50)
            .foregroundColor(theme(cs).lvDanger)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(theme(cs).viewD2L1)
            )
        }
    }
    
}

//struct ButtomDanger_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtomDanger(
//            text: "退出登录"
//        )
//    }
//}


struct ButtomItem: View {
    
    @Environment(\.colorScheme) var cs
    
    var text: String
    var icon: String
    
    var body: some View {
        Button(action: {
            print("退出登录")
        }){
            HStack() {
                Image(systemName: icon)
                    .padding(.horizontal, 4.0)
                    .font(.system(size: 14))
                    .foregroundColor(theme(cs).textL1D2)
                    .background(
                        Circle()
                            .fill(Color.gray)
                            .opacity(0.2)
                            .frame(width: 26, height: 26)
                    )

                Text(text)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(theme(cs).textL1D1)

                Spacer()

                Image(systemName: "chevron.compact.right")
                    .font(.system(size: 16))
                    .accentColor(theme(cs).textL2)
            }
            .padding()
            .frame(height: 50)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(theme(cs).viewD2L1)
            )
        }
    }
    
}

struct ButtomItem_Previews: PreviewProvider {
    static var previews: some View {
        ButtomItem(text: "创作者中心", icon: "wand.and.rays")
    }
}
