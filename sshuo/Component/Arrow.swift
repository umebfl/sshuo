//
//  Arrow.swift
//  sshuo
//
//  Created by ume on 2020/11/15.
//

import SwiftUI

struct ArrowIcon: View {
    
    @Environment(\.colorScheme) var cs

    var body: some View {
        Image(systemName: "chevron.compact.right")
            .font(.system(size: 16))
            .accentColor(light3Color)
    }
    
}

struct ArrowIcon_Previews: PreviewProvider {
    static var previews: some View {
        ArrowIcon()
    }
}
