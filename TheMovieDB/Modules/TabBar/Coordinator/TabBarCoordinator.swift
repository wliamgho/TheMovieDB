//
//  TabBarCoordinator.swift
//  TheMovieDB
//
//  Created by William on 10/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation

class TabBarBarCoordinator: BaseCoordinator {
    private let route: Route

    init(route: Route) {
        self.route = route
    }

    override func start() {
        let tabView = TabBarController()
        route.setRootModule(tabView, hideBar: false)
    }
}
