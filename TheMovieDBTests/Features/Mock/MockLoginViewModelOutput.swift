//
//  MockLoginViewModelOutput.swift
//  TheMovieDBTests
//
//  Created by William on 12/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa

@testable import TheMovieDB

class MockLoginViewModelOutput: LoginViewModelOutput {
    var invokedIsLoginGetter = false
    var invokedIsLoginGetterCount = 0
    var stubbedIsLogin: Driver<Bool>!

    var isLogin: Driver<Bool> {
        invokedIsLoginGetter = true
        invokedIsLoginGetterCount += 1
        return stubbedIsLogin
    }
}
