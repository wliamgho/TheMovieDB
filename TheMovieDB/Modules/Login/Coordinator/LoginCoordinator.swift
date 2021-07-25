//
//  LoginCoordinator.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import UIKit

class LoginCoordinator: BaseCoordinator {
    private let route: Route

    var finishFlow: (() -> Void?)?

    init(route: Route) {
        self.route = route
    }

    override func start() {
        let viewModel = LoginViewModel(route: self)
        let vc = LoginViewController(viewModel: viewModel)
        vc.viewModel = viewModel
        route.setRootModule(vc.createModule())
    }
}

extension LoginCoordinator: LoginViewModelRoute {
    func showNextView() {
        finishFlow?()
    }
}
