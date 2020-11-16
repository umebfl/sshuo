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

    @State var isAlert = false
    
    var text: String

    var alertTitle: String
    var alertMessage: String

    var yesText: String?
    var noText: String?

    var yesAction: () -> ()
//    var noAction: () -> ()
    

    var body: some View {
        
        var alert: Alert {
            Alert(title: Text(alertTitle),
            message: Text(alertMessage),
            primaryButton: Alert.Button.destructive(Text(noText ?? "取消")) {
//                noAction()
            },
            secondaryButton: Alert.Button.default(Text(yesText ?? "确认")) {
                yesAction()
            })
        }

        return Button(action: {
            self.isAlert = true
        }){
            HStack() {
                Spacer()
                Text(text)
                    .font(.system(size: 18))
                Spacer()
            }
            .padding()
            .frame(height: 50)
            .foregroundColor(theme(cs).lvDanger)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(theme(cs).viewD2L1)
            )
            .alert(isPresented: $isAlert, content: {
                alert
            })
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

                ArrowIcon()
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
