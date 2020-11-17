//
//  I18N.swift
//  sshuo
//
//  Created by ume on 2020/11/17.
//

// 当前文本集
let currentI18n = CNI18n

func I18n(_ str: String) -> String {
    return currentI18n[str] ?? str
}
