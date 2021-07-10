//
//  AuthCoordinator.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation

class AuthCoordinator: BaseCoordinator {
    private let route: Route

    init(route: Route) {
        self.route = route
    }

    override func start() {
        let loginCoordinator = LoginCoordinator(route: route)
        loginCoordinator.finishFlow(loginCoordinator)
        loginCoordinator.start()
    }
}
