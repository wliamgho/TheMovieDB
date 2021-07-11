//
//  Container+Coordinator.swift
//  TheMovieDB
//
//  Created by William on 10/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Swinject

extension Container {
    func registerCoodinators() {
        register(Presentable.self) { r in
            r.resolve(Route.self)!
        }.inObjectScope(.container)
        autoregister(Route.self,
                     initializer: NavigationRoute.init)
            .inObjectScope(.container)
        autoregister(AppCoordinator.self,
                     initializer: AppCoordinator.init)
        autoregister(LoginCoordinator.self,
                     initializer: LoginCoordinator.init)
    }
}
