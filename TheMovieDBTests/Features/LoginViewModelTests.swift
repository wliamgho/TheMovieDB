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
import Nimble
import Quick

@testable import TheMovieDB
class LoginViewModelTests: QuickSpec {
    var sut: LoginViewModel!
    var disposeBag: DisposeBag!
    var scheduler: TestScheduler!

    override func spec() {
        beforeEach {
            self.sut = LoginViewModel(route: MockLoginViewModelRoute())
            self.scheduler = TestScheduler(initialClock: 0)
            self.disposeBag = DisposeBag()
        }

        afterEach {
            self.sut = nil
            self.scheduler = nil
            self.disposeBag = nil
        }
    
        describe("Observe LoginForm") {
            context("empty email") {
                it("disabled login") {
                    // mock observer
                    let isEnabled = self.scheduler.createObserver(Bool.self)
                    // inject input
                    self.sut.input.password.onNext("test")
                    // inject output
                    self.sut.output.isLogin.drive(isEnabled).disposed(by: self.disposeBag)
                    self.simulateTap(at: 10)
                    // trigger scheduler
                    self.scheduler.start()
                    expect(isEnabled.events).to(equal([.next(0, false)]))
                }
            }

            context("empty password") {
                it("disabled login") {
                    let isEnabled = self.scheduler.createObserver(Bool.self)
                    self.sut.input.email.onNext("test")
                    self.sut.output.isLogin.drive(isEnabled).disposed(by: self.disposeBag)
                    self.simulateTap(at: 10)
                    self.scheduler.start()
                    expect(isEnabled.events).to(equal([.next(0, false)]))
                }
            }

            context("fullfill email password") {
                it("success") {
                    let isEnabled = self.scheduler.createObserver(Bool.self)
                    self.sut.input.email.onNext("email")
                    self.sut.input.password.onNext("password")
                    self.sut.output.isLogin.drive(isEnabled).disposed(by: self.disposeBag)
                    self.simulateTap(at: 10)
                    self.scheduler.start()
                    expect(isEnabled.events).to(equal([.next(0, true)]))
                }
            }
        }
    }

    func simulateTap(at times: Int...) {
        // Test Scheduler to emit event
        let events: [Recorded<Event<Void>>] = times.map { Recorded.next($0, ()) }
        let taps = scheduler.createHotObservable(events)
        taps.bind(to: sut.input.loginAction).disposed(by: disposeBag)
    }
}
