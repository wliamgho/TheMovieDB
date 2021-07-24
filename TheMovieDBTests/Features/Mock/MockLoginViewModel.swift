//
//  MockLoginViewModel.swift
//  TheMovieDBTests
//
//  Created by William on 12/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa

@testable import TheMovieDB

class MockLoginViewModel: LoginViewModel {
    
    // Output
    var invokedIsLoginGetter = false
    var invokedIsLoginGetterCount = 0
    var stubbedIsLogin: Driver<Bool>!

    var isLogin: Driver<Bool> {
        invokedIsLoginGetter = true
        invokedIsLoginGetterCount += 1
        return stubbedIsLogin
    }

    // Input
    var invokedDidLogin = false
    var invokedDidLoginCount = 0
    var invokedDidLoginParameters: (email: Observable<String>, password: Observable<String>, loginAction: Observable<Void>)?
    var invokedDidLoginParametersList = [(email: Observable<String>, password: Observable<String>, loginAction: Observable<Void>)]()

    func didLogin(email: Observable<String>,
        password: Observable<String>,
        loginAction: Observable<Void>) {
        invokedDidLogin = true
        invokedDidLoginCount += 1
        invokedDidLoginParameters = (email, password, loginAction)
        invokedDidLoginParametersList.append((email, password, loginAction))
    }
}
