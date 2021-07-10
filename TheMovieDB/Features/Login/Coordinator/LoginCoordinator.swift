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

    init(route: Route) {
        self.route = route
    }

    override func start() {
        let vc = LoginViewController()
        let actions = LoginViewModelActions(showNextView: {
            self.finishFlow(self)
            self.showNextView()
        })
        let viewModel = LoginViewModel(actions: actions)
        vc.viewModel = viewModel
        route.setRootModule(vc.createModule())
    }

    private func showNextView() {
//        route.push(NextViewController().createModule())        
    }
}
