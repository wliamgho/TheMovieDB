//
//  LoginViewModelTests.swift
//  TheMovieDBTests
//
//  Created by William on 12/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
import RxBlocking

@testable import TheMovieDB
class LoginViewModelTests: XCTestCase {
    var disposeBag: DisposeBag!
    var viewModel: MockLoginViewModel!
    var scheduler: ConcurrentDispatchQueueScheduler!
    var mockScheduler: TestScheduler!

    override func setUp() {
        super.setUp()
        disposeBag = DisposeBag()
        viewModel = MockLoginViewModel()
        scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
        mockScheduler = TestScheduler(initialClock: 0)
    }

    override func tearDown() {
        disposeBag = nil
        viewModel = nil
        scheduler = nil
        mockScheduler = nil
        super.tearDown()
    }

    func test_loginButtonEnabled() {
        let enabled = mockScheduler.createObserver(Bool.self)
    }
}
