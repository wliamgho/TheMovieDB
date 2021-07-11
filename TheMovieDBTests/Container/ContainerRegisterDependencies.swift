//
//  ContainerRegisterDependencies.swift
//  TheMovieDBTests
//
//  Created by William on 11/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import XCTest
import Swinject
import SwinjectAutoregistration

@testable import TheMovieDB
extension Container_RegisterDependenciesTests {
    func registerDependenciesTest() -> Container {
        // NavigationRoute
        let container = Container()
        container.autoregister(Route.self,
                               initializer: NavigationRoute.init)
            .inObjectScope(.container)
        container.register(Presentable.self) { r in
            r.resolve(Route.self)!
        }.inObjectScope(.container)
        // Coordinator
        container.autoregister(AppCoordinator.self,
                               initializer: AppCoordinator.init)
        container.autoregister(LoginCoordinator.self,
                               initializer: LoginCoordinator.init)
        container.autoregister(LoginViewModelRoute.self,
                               initializer: LoginCoordinator.init)
        // ViewModel
        container.register(LoginViewModel.self) { r in
            let vm = LoginViewModel(route: r.resolve(LoginViewModelRoute.self)!)
            return vm
        }
        // ViewController
        container.autoregister(LoginViewController.self,
                               initializer: LoginViewController.init)
        return container
    }
}
