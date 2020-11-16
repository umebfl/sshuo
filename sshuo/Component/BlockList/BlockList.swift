//
//  Test.swift
//  sshuo
//
//  Created by ume on 2020/11/15.
//
import SwiftUI

struct BlockListTitle: View {

    @Environment(\.colorScheme) var cs

    var title: String?

    var body: some View {
        HStack() {
            Text(title ?? "")
            Spacer()
        }
//        .frame(height: 30)
        .padding(.horizontal)
        .padding(.top, 16.0)
        .padding(.bottom, 4.0)
        .font(.system(size: 12))
        .foregroundColor(theme(cs).textGray)

        Divider()
            .opacity(0.5)
    }
}


struct TestView: View {
    
    var body: some View {
        Text("xx")
    }
}

struct BlockListItem: View {

    @Environment(\.colorScheme) var cs

    var title: String
    var icon: String
    var msg: String? = ""
//    var action: () -> ()

//    var touching = false

    var body: some View {
        
//        let tapGesture = LongPressGesture()
//            .updating($touching) { value, state, transcation in
//                print(value, state, transcation)
//                state = value
//            }.onEnded { Value in
//                print("end:\(Value)")
//            }
        
        return
            
//            NavigationLink(destination: TestView() ) {
                HStack() {
                    Image(systemName: icon)
                        .padding(.horizontal, 4.0)
                        .font(.system(size: 15))
                        .foregroundColor(theme(cs).textL1D2)

                    Text(title)
                        .font(.system(size: 16))
                        .foregroundColor(theme(cs).textL1D1)

                    Spacer()

                    Text(msg!)
                        .font(.system(size: 12))
                        .foregroundColor(theme(cs).textGray)

                    ArrowIcon()
                }
                .padding()
                .frame(height: 44)
//                .background(
//                    Rectangle()
//                        .fill(theme(cs).main)
//                        .opacity(touching ? 0.2 : 0)
//                )
//                .gesture(tapGesture)
//            }
        
//            Button(action: {
//                print("BlockListItem action")
////                action()
//            }){
//                HStack() {
//                    Image(systemName: icon)
//                        .padding(.horizontal, 4.0)
//                        .font(.system(size: 14))
//                        .foregroundColor(theme(cs).textL1D2)
//
//                    Text(title)
//                        .font(.system(size: 16))
//                        .foregroundColor(theme(cs).textL1D1)
//
//                    Spacer()
//
//                    Text(msg!)
//                        .font(.system(size: 12))
//                        .foregroundColor(theme(cs).textGray)
//
//                    Image(systemName: "chevron.compact.right")
//                        .font(.system(size: 16))
//                        .accentColor(theme(cs).textL2)
//                }
//                .padding()
//                .frame(height: 50)
////                .background(
////                    Rectangle()
////                        .fill(theme(cs).main)
////                        .opacity(touching ? 0.2 : 0)
////                )
////                .gesture(tapGesture)
//            }
    }
}


struct BlockList: View {
    
    @Environment(\.colorScheme) var cs
    
    var title: String?
    var listData: [[String: String]]

    var body: some View {
        VStack {
            if(title != nil) {
                BlockListTitle(title: title)
            }

            ForEach(listData, id: \.self) { item in
                NavigationLink(destination: MyDetailView(message: "Detail Page #2") ) {
                    BlockListItem(
                        title: item["title"] ?? "",
                        icon: item["icon"] ?? "",
                        msg: item["msg"] ?? ""
                    )
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(theme(cs).viewD2L1)
        )
        .padding(.vertical, 5)
    }
    
}

struct MyDetailView: View {
    
    let message: String

    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
        }
    }
}

struct BlockList_Previews: PreviewProvider {
    static var previews: some View {
        
        return BlockList(
            title: "xx",
            listData: [
                ["title": "演出", "icon": "waveform", "msg": "未开始"]
            ]
//            node: [
//                BlockListItem(title: "演出", icon: "waveform", msg: "未开始", action: test),
//                BlockListItem(title: "商场", icon: "tv.circle", action: test),
//                BlockListItem(title: "口袋彩铃", icon: "sun.haze", action: test),
//                BlockListItem(title: "游戏中心", icon: "star", action: test)
//            ]
        )
    }
}
