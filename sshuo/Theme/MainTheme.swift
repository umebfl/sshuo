//
//  MainTheme.swift
//  sshuo
//
//  Created by ume on 2020/11/13.
//
import SwiftUI

// 白天 黑夜
struct Theme {
    // 主色
    var main: Color
    
    // 等级色
    var lvDanger: Color
    
    // 非切换颜色
    var textL2: Color
    var textL1: Color
    var text: Color
    var textD1: Color
    var textD2: Color
    
    // 切换颜色
    // 文本颜色 黑012-白012
    var textD1L1: Color
    var textD2L1: Color
    
    var textL1D1: Color
    var textL1D2: Color
    
    // 面板颜色 黑012白012
    var viewD2L1: Color
    var viewD1L2: Color
}


let mainColor = Color.red

var light0Color = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255, opacity: 1)
var light1Color = Color(red: 240 / 255, green: 241 / 255, blue: 242 / 255, opacity: 1)
var light2Color = Color(red: 220 / 255, green: 221 / 255, blue: 222 / 255, opacity: 1)

var dep0Color = Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255, opacity: 1)
var dep1Color = Color(red: 20 / 255, green: 21 / 255, blue: 22 / 255, opacity: 1)
var dep2Color = Color(red: 31 / 255, green: 32 / 255, blue: 33 / 255, opacity: 1)

var ThemeLight = Theme(
    // 主色
    main: Color.red,
    lvDanger: Color.red,
    
    textL2: light2Color,
    textL1: light1Color,
    text: dep0Color,
    textD1: dep1Color,
    textD2: dep2Color,

    textD1L1: light1Color,
    textD2L1: light1Color,

    textL1D1: dep1Color,
    textL1D2: dep2Color,

    viewD2L1: light1Color,
    viewD1L2: light2Color
)

var ThemeDark = Theme(
    // 主色
    main: Color.blue,
    lvDanger: Color.red,
    
    textL2: light2Color,
    textL1: light1Color,
    text: dep0Color,
    textD1: dep1Color,
    textD2: dep2Color,

    textD1L1: dep1Color,
    textD2L1: dep2Color,
    
    textL1D1: light1Color,
    textL1D2: light1Color,

    viewD2L1: dep2Color,
    viewD1L2: dep1Color
)

// 主体样式
func theme(_ colorScheme: ColorScheme) -> Theme {
    return colorScheme == .dark ? ThemeDark : ThemeLight
}

// 自定义样式
//struct ThemeCustom {
//
//}
//
//var ThemeCustom1 = {}
//var ThemeCustom2 = {}
//
//func ctheme(_ type: Int) -> ThemeCustom {
//    return type == 1 ? ThemeCustom1 : ThemeCustom2
//}
