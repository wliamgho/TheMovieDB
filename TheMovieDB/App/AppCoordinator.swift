//
//  AppCoordinator.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation
import Swinject

class AppCoordinator: BaseCoordinator {
    private let route: Route

    init(route: Route) {
        self.route = route
    }

    override func start() {
//        switch Defaults.hasLogin() {
//        case true:
//            // Show Tab
//            print("has logged in")
//            showTabFlow()
//        case false:
//            // Show Login
//            print("not logged in")
//            showLoginFlow()
//        }
        showLoginFlow()
    }

    private func showTabFlow() {
        let coordinator = AppDelegate.container.resolve(TabBarBarCoordinator.self)!
        addChild(coordinator)
        coordinator.start()
    }

    private func showLoginFlow() {
        let coordinator = AppDelegate.container.resolve(LoginCoordinator.self)!
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.start()
            return self?.finishFlow(coordinator!)
        }
        addChild(coordinator)
        coordinator.start()
    }
}
