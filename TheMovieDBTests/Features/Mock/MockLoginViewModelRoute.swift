//
//  MockLoginViewModelRoute.swift
//  TheMovieDBTests
//
//  Created by William on 12/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import XCTest

@testable import TheMovieDB

class MockLoginViewModelRoute: LoginViewModelRoute {
    var invokedShowNextView = false
    var invokedShowNextViewCount = 0

    func showNextView() {
        invokedShowNextView = true
        invokedShowNextViewCount += 1
    }
}
