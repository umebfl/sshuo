//
//  DLBackgroundModifier.swift
//  sshuo
//
//  Created by ume on 2020/11/14.
//

import SwiftUI



// 支持暗模式背景装饰器
struct BackgroundModifier: ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .background(
                Rectangle()
                    .fill(theme(colorScheme).viewD1L2)
                    .blur(radius: 0.2)
                    .opacity(0.7)
//                    .opacity(0.96)
//                    .border(colorScheme == .dark ? depColor : lightColor, width: 1)
            )
    }
}

// 带白渐变的支持暗模式背景装饰器
struct WLinerBackgroundModifier: ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(
                    gradient: Gradient(
                        stops: [
                            .init(color: theme(colorScheme).viewD1L2, location: 0.05),
                            .init(color: theme(colorScheme).viewD1L2, location: 0.5)
                        ]
//                      colors: [.white, .black]
                    ),
                    startPoint: .topLeading,
                    endPoint: .bottomLeading
                )
                .scaledToFill()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            )
    }
}

// 带暗渐变的支持暗模式背景装饰器
struct DWLinerBackgroundModifier: ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(
                    gradient: Gradient(
                        stops: [
                            .init(color: theme(colorScheme).viewD2L1, location: 0.05),
                            .init(color: theme(colorScheme).viewD1L2, location: 0.5)
                        ]
//                      colors: [.white, .black]
                    ),
                    startPoint: .topLeading,
                    endPoint: .bottomLeading
                )
                .scaledToFill()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            )
    }
}

struct DLBackgroundModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center, spacing: 40){
            Text("DLBackgroundModifier")
            Spacer()
        }.modifier(BackgroundModifier())
    }
}
