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

final class DefaultLoginViewModel {
    var isLogin: Driver<Bool> = Driver.just(false)

    private let disposeBag = DisposeBag()
    var route: LoginViewModelRoute
    
    init(route: LoginViewModelRoute) {
        self.route = route
    }
}

extension DefaultLoginViewModel: LoginViewModel {
    func didLogin(email: Observable<String>, password: Observable<String>, loginAction: Observable<Void>) {
        let isFormValid = Observable.combineLatest(email, password) { (email, password) in
            return !email.isEmpty && !password.isEmpty
        }.asDriver(onErrorJustReturn: false)

        // Update is login
        isLogin = isFormValid

        loginAction.withLatestFrom(isFormValid).subscribe(onNext: { [weak self] _ in
            Defaults.setHasLogin(true)
            self?.route.showNextView()
        }, onError: { error in
            print("ERROR", error.localizedDescription)
        }).disposed(by: disposeBag)
    }
}
