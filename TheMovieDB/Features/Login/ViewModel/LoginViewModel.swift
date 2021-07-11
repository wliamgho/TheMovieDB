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

protocol LoginViewModelRoute {
    func showNextView()
}

final class LoginViewModel {
    private let dispose = DisposeBag()
    var route: LoginViewModelRoute
    
    init(route: LoginViewModelRoute) {
        self.route = route
    }
}

extension LoginViewModel: ViewModel {
    struct Input {
        let email: Observable<String>
        let password: Observable<String>
        let loginTapped: Observable<Void>
    }

    struct Output {
        let isLogin: Driver<Bool>
    }

    func transform(_ input: Input) -> Output {
        let isFormValid = Observable.combineLatest(input.email, input.password) { (username, password) in
            return !username.isEmpty && !password.isEmpty
        }.asDriver(onErrorJustReturn: false)
        input.loginTapped.withLatestFrom(isFormValid).subscribe(onNext: { [weak self] _ in
            Defaults.setHasLogin(true)
            self?.route.showNextView()
        }).disposed(by: dispose)
        return Output(isLogin: isFormValid)
    }
}
