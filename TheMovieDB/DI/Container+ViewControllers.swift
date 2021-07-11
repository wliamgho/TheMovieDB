//
//  Container+ViewControllers.swift
//  TheMovieDB
//
//  Created by William on 11/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Swinject

extension Container {
    func registerViewControllers() {
        autoregister(LoginViewController.self,
                     initializer: LoginViewController.init)
    }
}
