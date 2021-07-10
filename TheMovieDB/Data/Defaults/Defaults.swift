//
//  Defaults.swift
//  TheMovieDB
//
//  Created by William on 10/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation

private let defaults = UserDefaults.standard

struct Defaults {
    static func setHasLogin(_ isLogggedIn: Bool) {
        return defaults.setValue(isLogggedIn, forKey: "UserLogin")
    }

    static func hasLogin() -> Bool {
        return defaults.bool(forKey: "UserLogin")
    }
}
