//
//  AuthContainer.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation

struct AuthContainer {
    func makeLoginFlowCoordinator(route: Route) -> Coordinator {
        return AuthCoordinator(route: route)
    }
}
