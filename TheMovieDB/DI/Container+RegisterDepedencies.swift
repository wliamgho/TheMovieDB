//
//  Container+RegisterDepedencies.swift
//  TheMovieDB
//
//  Created by William on 10/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    func registerDependencies() {
        // Register service
        // Register Coordinator
        registerCoodinators()
        // Register ViewModel
        registerViewModels()
    }
}
