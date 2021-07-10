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

struct LoginViewModelActions {
    let showNextView: () -> Void
}

final class LoginViewModel {
    private let actions: LoginViewModelActions
    init(actions: LoginViewModelActions) {
        self.actions = actions
        print("INITIALIZE LOGIN VIEW MODEL")
    }
}

extension LoginViewModel: ViewModel {
    struct Input {
        
    }
}

//extension LoginViewModel: ViewModelType {
//    struct Input {
//        let tapped: () -> Void
//    }
//
//    struct Output {
//
//    }
//
//    func transform(_ input: Input) -> Output {
//        return Output()
//    }
//}
