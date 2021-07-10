//
//  AppCoordinator.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation

class AppCoordinator: BaseCoordinator {
    private let route: Route
    private let container: AppDIContainer

    init(route: Route, container: AppDIContainer) {
        self.route = route
        self.container = container
    }

    override func start() {
        let auth = container.authContainer
        let coordinator = auth.makeLoginFlowCoordinator(route: route)
//        coordinator.finishFlow {
//            self.removeChild(coordinator)
//        }
        addChild(coordinator)
        coordinator.start()
    }
}
