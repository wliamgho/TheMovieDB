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

class LoginViewModel: ViewModel {
    private let disposeBag = DisposeBag()
    var route: LoginViewModelRoute

    let loginTapped: PublishSubject<Void> = .init()
    
    init(route: LoginViewModelRoute) {
        self.route = route
    }
}

extension LoginViewModel: ViewModelType {
    struct Input {
        let email: Observable<String>
        let password: Observable<String>
        let loginAction: Observable<Void>
    }
    
    struct Output {
        var isLogin: Driver<Bool>
    }

    func transform(_ input: Input) -> Output {
        let isValidForm = Observable.combineLatest(input.email, input.password) { (email, password) in
            return !email.isEmpty && !password.isEmpty
        }.asDriver(onErrorJustReturn: false)

        input.loginAction.withLatestFrom(isValidForm).subscribe(onNext: { [weak self] _ in
            Defaults.setHasLogin(true)
            self?.route.showNextView()
        }, onError: { error in
            // TODO: Show as Alert
            Log.info(error.localizedDescription)
        }).disposed(by: disposeBag)

        return Output(isLogin: isValidForm)
    }
}
