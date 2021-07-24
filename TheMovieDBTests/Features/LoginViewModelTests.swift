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
        }
    
        describe("Observe LoginForm") {
            describe("success") {
                it("IsEnabledLogin") {
                    let emailTrigger = Observable<String>.just("email")
                    let passwordTrigger = Observable<String>.just("password")
                    let loginAction = Observable<Void>.just(())
                    let output = self.sut.transform(self.createInput(emailTrigger: emailTrigger,
                                                                     passwordTrigger: passwordTrigger,
                                                                     loginAction: loginAction))
                    output.isLogin.drive().disposed(by: self.disposeBag)
                    let isEnabled = try! output.isLogin.toBlocking().first()
                    expect(isEnabled) == true
                }
            }

            describe("invalid") {
                it("DisabledLogin") {
                    let emailTrigger = Observable<String>.just("email")
                    let loginAction = Observable<Void>.just(())
                    let output = self.sut.transform(self.createInput(emailTrigger: emailTrigger,
                                                                     loginAction: loginAction))
                    output.isLogin.drive().disposed(by: self.disposeBag)
                    let isEnabled = try! output.isLogin.toBlocking().first()
                    expect(isEnabled) == false
                }
            }
        }
    }

    func createInput(emailTrigger: Observable<String> = Observable.just(""),
                     passwordTrigger: Observable<String> = Observable.just(""),
                     loginAction: Observable<Void> = Observable.just(())) -> LoginViewModel.Input {
        return LoginViewModel.Input(email: emailTrigger,
                                    password: passwordTrigger,
                                    loginAction: loginAction)
    }
}
