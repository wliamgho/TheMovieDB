//
//  NetworkModule.swift
//  TheMovieDB
//
//  Created by William on 04/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation
import Cleanse

struct NetworkModule: Module {
    static func configure(binder: SingletonBinder) {
        binder.include(module: NetworkSessionRequest.Module.self)
        binder.include(module: NetworkSession.Module.self)
    }
}
