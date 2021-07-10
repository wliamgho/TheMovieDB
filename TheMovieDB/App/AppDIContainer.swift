//
//  AppDI.swift
//  TheMovieDB
//
//  Created by William on 04/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation
import Swinject

struct AppDIContainer {
    let authContainer: AuthContainer = {
        let container = Container()
        let authContainer = AuthContainer()
        container.register(AuthContainer.self) { _ in authContainer }
        return authContainer
    }()
}
