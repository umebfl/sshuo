//
//  DiaryView.swift
//  sshuo
//
//  Created by ume on 2020/11/13.
//

import SwiftUI

struct DiaryView: View {
    
    var body: some View {
        VStack() {
//            TabContentView()
            ScrollView() {
                Image("BG")
                VStack() {
                    ForEach(0 ..< 100, id: \.self) { item in
                        HStack() {
                            Text("ssss:\(item)")
                            Spacer()
                        }
                   }
                }
                Image("BG")
            }
            
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
        .background(
            Image("BG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        )
    }
    
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}
