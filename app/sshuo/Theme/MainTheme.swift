//
//  MainTheme.swift
//  sshuo
//
//  Created by ume on 2020/11/13.
//
//import SwiftUI
import UIKit

enum ThemeType {
    case System // 暗黑和白天
    case Night  // 夜间
    // ..其他自定义主题
}

// 当前使用的样式
fileprivate var ThemeCurrent = ThemeType.System

// 修改当前样式
func setCurrentTheme(_ type: ThemeType) {
    ThemeCurrent = type
}

fileprivate let mainColor = UIColor.red

var light0Color = UIColor(displayP3Red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
var light1Color = UIColor(displayP3Red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1)
var light2Color = UIColor(displayP3Red: 235 / 255, green: 235 / 255, blue: 235 / 255, alpha: 1)
var light3Color = UIColor(displayP3Red: 215 / 255, green: 215 / 255, blue: 215 / 255, alpha: 1)

var dep0Color = UIColor(displayP3Red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1)
var dep1Color = UIColor(displayP3Red: 25 / 255, green: 25 / 255, blue: 25 / 255, alpha: 1)
var dep2Color = UIColor(displayP3Red: 40 / 255, green: 40 / 255, blue: 40 / 255, alpha: 1)


var depAp2Color = UIColor(displayP3Red: 25 / 255, green: 25 / 255, blue: 25 / 255, alpha: 0.2)
var depAp3Color = UIColor(displayP3Red: 25 / 255, green: 25 / 255, blue: 25 / 255, alpha: 0.3)
var depAp4Color = UIColor(displayP3Red: 25 / 255, green: 25 / 255, blue: 25 / 255, alpha: 0.4)
var depAp5Color = UIColor(displayP3Red: 25 / 255, green: 25 / 255, blue: 25 / 255, alpha: 0.5)
var depAp6Color = UIColor(displayP3Red: 25 / 255, green: 25 / 255, blue: 25 / 255, alpha: 0.6)

var lightAp2Color = UIColor(displayP3Red: 235 / 255, green: 235 / 255, blue: 235 / 255, alpha: 0.2)
var lightAp3Color = UIColor(displayP3Red: 235 / 255, green: 235 / 255, blue: 235 / 255, alpha: 0.3)
var lightAp4Color = UIColor(displayP3Red: 235 / 255, green: 235 / 255, blue: 235 / 255, alpha: 0.4)
var lightAp5Color = UIColor(displayP3Red: 235 / 255, green: 235 / 255, blue: 235 / 255, alpha: 0.5)
var lightAp6Color = UIColor(displayP3Red: 235 / 255, green: 235 / 255, blue: 235 / 255, alpha: 0.6)

var grayColor = UIColor(displayP3Red: 100 / 255, green: 100 / 255, blue: 100 / 255, alpha: 1)


// 白天 黑夜
struct Theme {
    // 主色
    var main: UIColor

    // 等级色
    var lvDanger: UIColor

    var textL2: UIColor
    var textL1: UIColor
    var text: UIColor
    var textD1: UIColor
    var textD2: UIColor

    // 切换颜色
    // 文本颜色 黑12-白12
    var textL1D1: UIColor
    var textL1D2: UIColor
    var textL2D1: UIColor
    var textL2D2: UIColor

    var textD1L1: UIColor
    var textD1L2: UIColor
    var textD2L1: UIColor
    var textD2L2: UIColor

    // 面板颜色 黑012白012
    var viewL1D1: UIColor
    var viewL1D2: UIColor
    var viewL2D1: UIColor
    var viewL2D2: UIColor

    var viewD1L1: UIColor
    var viewD1L2: UIColor
    var viewD2L1: UIColor
    var viewD2L2: UIColor
}


//// 白天模式
fileprivate var ThemeLight = Theme(
    // 主色
    main: mainColor,
    lvDanger: UIColor.red,

    textL2: light2Color,
    textL1: light1Color,
    text: dep0Color,
    textD1: dep1Color,
    textD2: dep2Color,

    textL1D1: dep1Color,
    textL1D2: dep2Color,
    textL2D1: dep1Color,
    textL2D2: dep2Color,

    textD1L1: light0Color,
    textD1L2: light2Color,
    textD2L1: light0Color,
    textD2L2: light2Color,

    viewL1D1: dep1Color,
    viewL1D2: dep2Color,
    viewL2D1: dep1Color,
    viewL2D2: dep2Color,

    viewD1L1: light0Color,
    viewD1L2: light2Color,
    viewD2L1: light0Color,
    viewD2L2: light2Color
)

// 深色模式
fileprivate var ThemeDark = Theme(
    // 主色
    main: mainColor,
    lvDanger: UIColor.red,

    textL2: light2Color,
    textL1: light0Color,
    text: dep0Color,
    textD1: dep1Color,
    textD2: dep2Color,

    textL1D1: light0Color,
    textL1D2: light0Color,
    textL2D1: light2Color,
    textL2D2: light2Color,

    textD1L1: dep1Color,
    textD1L2: dep1Color,
    textD2L1: dep2Color,
    textD2L2: dep2Color,

    viewL1D1: light0Color,
    viewL1D2: light0Color,
    viewL2D1: light2Color,
    viewL2D2: light2Color,

    viewD1L1: dep1Color,
    viewD1L2: dep1Color,
    viewD2L1: dep2Color,
    viewD2L2: dep2Color
)




func theme() -> Theme {
    
    let mode = UITraitCollection.current.userInterfaceStyle

    if ThemeCurrent == ThemeType.System {
        return mode == .dark ? ThemeDark : ThemeLight
    }

//    if ThemeCurrent == ThemeType.Night {
//        return ThemeNight
//    }

    return ThemeLight
}




//fileprivate let mainColor = Color.red
//
//var light0Color = UIColor(displayP3Red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
//var light1Color = UIColor(displayP3Red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1)
//var light2Color = UIColor(displayP3Red: 235 / 255, green: 235 / 255, blue: 235 / 255, alpha: 1)
//var light3Color = UIColor(displayP3Red: 215 / 255, green: 215 / 255, blue: 215 / 255, alpha: 1)
//
//var dep0Color = UIColor(displayP3Red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1)
//var dep1Color = UIColor(displayP3Red: 25 / 255, green: 25 / 255, blue: 25 / 255, alpha: 1)
//var dep2Color = UIColor(displayP3Red: 40 / 255, green: 40 / 255, blue: 40 / 255, alpha: 1)
//
//var grayColor = UIColor(displayP3Red: 100 / 255, green: 100 / 255, blue: 100 / 255, alpha: 1)
//
//
//// 白天 黑夜
//struct Theme {
//    // 主色
//    var main: Color
//
//    // 等级色
//    var lvDanger: Color
//
//    // 非切换颜色
//    var textGray: Color
//
//    var textL2: Color
//    var textL1: Color
//    var text: Color
//    var textD1: Color
//    var textD2: Color
//
//    // 切换颜色
//    // 文本颜色 黑12-白12
//    var textL1D1: Color
//    var textL1D2: Color
//    var textL2D1: Color
//    var textL2D2: Color
//
//    var textD1L1: Color
//    var textD1L2: Color
//    var textD2L1: Color
//    var textD2L2: Color
//
//    // 面板颜色 黑012白012
//    var viewL1D1: Color
//    var viewL1D2: Color
//    var viewL2D1: Color
//    var viewL2D2: Color
//
//    var viewD1L1: Color
//    var viewD1L2: Color
//    var viewD2L1: Color
//    var viewD2L2: Color
//}
//
//// 白天模式
//fileprivate var ThemeLight = Theme(
//    // 主色
//    main: mainColor,
//    lvDanger: Color.red,
//    textGray: grayColor,
//
//    textL2: light2Color,
//    textL1: light1Color,
//    text: dep0Color,
//    textD1: dep1Color,
//    textD2: dep2Color,
//
//    textL1D1: dep1Color,
//    textL1D2: dep2Color,
//    textL2D1: dep1Color,
//    textL2D2: dep2Color,
//
//    textD1L1: light0Color,
//    textD1L2: light2Color,
//    textD2L1: light0Color,
//    textD2L2: light2Color,
//
//    viewL1D1: dep1Color,
//    viewL1D2: dep2Color,
//    viewL2D1: dep1Color,
//    viewL2D2: dep2Color,
//
//    viewD1L1: light0Color,
//    viewD1L2: light2Color,
//    viewD2L1: light0Color,
//    viewD2L2: light2Color
//)
//
//// 深色模式
//fileprivate var ThemeDark = Theme(
//    // 主色
//    main: mainColor,
//    lvDanger: Color.red,
//    textGray: grayColor,
//
//    textL2: light2Color,
//    textL1: light0Color,
//    text: dep0Color,
//    textD1: dep1Color,
//    textD2: dep2Color,
//
//    textL1D1: light0Color,
//    textL1D2: light0Color,
//    textL2D1: light2Color,
//    textL2D2: light2Color,
//
//    textD1L1: dep1Color,
//    textD1L2: dep1Color,
//    textD2L1: dep2Color,
//    textD2L2: dep2Color,
//
//    viewL1D1: light0Color,
//    viewL1D2: light0Color,
//    viewL2D1: light2Color,
//    viewL2D2: light2Color,
//
//    viewD1L1: dep1Color,
//    viewD1L2: dep1Color,
//    viewD2L1: dep2Color,
//    viewD2L2: dep2Color
//)
//
//// 自定义样式
//// 夜间模式
//fileprivate var ThemeNight = Theme(
//    // 主色
//    main: mainColor,
//    lvDanger: Color.red,
//    textGray: grayColor,
//
//    textL2: light2Color,
//    textL1: light1Color,
//    text: dep0Color,
//    textD1: dep1Color,
//    textD2: dep2Color,
//
//    textL1D1: light1Color,
//    textL1D2: light1Color,
//    textL2D1: light2Color,
//    textL2D2: light2Color,
//
//    textD1L1: dep1Color,
//    textD1L2: dep1Color,
//    textD2L1: dep2Color,
//    textD2L2: dep2Color,
//
//    viewL1D1: light1Color,
//    viewL1D2: light1Color,
//    viewL2D1: light2Color,
//    viewL2D2: light2Color,
//
//    viewD1L1: dep1Color,
//    viewD1L2: dep1Color,
//    viewD2L1: dep2Color,
//    viewD2L2: dep2Color
//)
//
//// 主体样式
//func theme(_ colorScheme: ColorScheme) -> Theme {
//
//    if ThemeCurrent == ThemeType.System {
//        return colorScheme == .dark ? ThemeDark : ThemeLight
//    }
//
//    if ThemeCurrent == ThemeType.Night {
//        return ThemeNight
//    }
//
//    return ThemeLight
//}

