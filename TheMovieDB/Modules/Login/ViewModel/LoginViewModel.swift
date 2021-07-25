//
//  LoginViewModel.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol LoginViewModelRoute: AnyObject {
    func showNextView()
}

class LoginViewModel: ViewModel, ViewModelType {
    struct Input {
        let email: AnyObserver<String>
        let password: AnyObserver<String>
        let loginAction: AnyObserver<Void>
    }

    struct Output {
        var isLogin: Driver<Bool>
    }

    var input: Input!
    var output: Output!

    private let disposeBag = DisposeBag()
    var route: LoginViewModelRoute

    private let email = BehaviorSubject<String>.init(value: "")
    private let password = BehaviorSubject<String>.init(value: "")
    private let loginTapped: PublishSubject<Void> = .init()

    init(route: LoginViewModelRoute) {
        self.route = route

        super.init()

        input = Input(email: email.asObserver(),
                      password: password.asObserver(),
                      loginAction: loginTapped.asObserver())

        output = Output(isLogin: loginEnabled())
    }

    private func loginEnabled() -> Driver<Bool> {
        Observable.combineLatest(email, password) { (email, password) in
            return !email.isEmpty && !password.isEmpty
        }.asDriver(onErrorJustReturn: false)
    }
}
