//
//  HomeView.swift
//  sshuo
//
//  Created by ume on 2020/11/13.
//

import SwiftUI

struct D1View: View {

    var body: some View {
        Text("D1View")
    }
    
}

struct BottomView: View {
    
    var body: some View {
        Text("BottomView")
    }
    
}

struct HomeView: View {
    
    var body: some View {
        ZStack {
            D1View()
            BottomView()
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
