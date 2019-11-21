//
//  Theme.swift
//  MidTerm
//
//  Created by AUTO SERVER on 11/21/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import Foundation


class Theme {
    static let fontName = UserDefaults.standard.value(forKey: "eventFont")
    static let fontColor = UserDefaults.standard.value(forKey: "eventFontColor")
    static let fontSize = UserDefaults.standard.value(forKey: "eventFontSize")
}
