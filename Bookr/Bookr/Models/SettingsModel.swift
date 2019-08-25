//
//  SettingsModel.swift
//  Bookr
//
//  Created by Aaron on 8/22/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import Foundation

enum Mode: String {
    case dark
    case light
}

struct SettingsModel {
    let title: String
    let color: Mode
}
