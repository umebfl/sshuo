//
//  ModuleViewModifier.swift
//  sshuo
//
//  Created by ume on 2020/11/15.
//

import SwiftUI

struct ModuleViewModifier: ViewModifier {
    
    @Environment(\.colorScheme) var cs

    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(
                    gradient: Gradient(
                        stops: [
                            .init(color: theme(cs).viewD2L1, location: 0.02),
                            .init(color: theme(cs).viewD1L2, location: 0.1)
                        ]
                    ),
                    startPoint: .topLeading,
                    endPoint: .bottomLeading
                )
                .scaledToFill()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            )
    }
}

struct ModuleViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center, spacing: 40){
            Text("ModuleViewModifier")
            Spacer()
        }.modifier(ModuleViewModifier())
    }
}
