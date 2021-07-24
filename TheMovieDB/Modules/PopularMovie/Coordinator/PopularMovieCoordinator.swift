//
//  PopularMovieCoordinator.swift
//  TheMovieDB
//
//  Created by William on 13/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation

class PopularMovieCoordinator: BaseCoordinator {
    private let route: Route

    init(route: Route) {
        self.route = route
    }

    override func start() {
        let viewModel = DefaultPopularViewModel()
        let vc = PopularMovieViewController(viewModel: viewModel)
        route.setRootModule(vc)
    }
}
