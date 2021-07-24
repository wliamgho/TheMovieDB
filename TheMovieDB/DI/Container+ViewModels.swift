//
//  Container+ViewModels.swift
//  TheMovieDB
//
//  Created by William on 10/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Swinject

extension Container {
    func registerViewModels() {
        register(LoginViewModel.self) { r in
            let vm = LoginViewModel(route: r.resolve(LoginViewModelRoute.self)!)
            return vm
        }
    }
}
