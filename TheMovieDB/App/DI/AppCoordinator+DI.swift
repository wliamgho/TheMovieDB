//
//  AppCoordinator+DI.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation
import Cleanse

extension AppCoordinator {
    struct Module: Cleanse.Module {
        static func configure(binder: SingletonBinder) {
            binder.include(module: BaseCoordinator.Module.self)
        }
    }
}
