//
//  BaseCoordinator+DI.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation
import Cleanse

extension BaseCoordinator {
    struct Module: Cleanse.Module {
        static func configure(binder: SingletonBinder) {
//            binder.bind().to(factory: BaseCoordinator.init)
            binder.bind(Coordinator.self).sharedInScope().to(value: BaseCoordinator.init())
        }

//        static func configureStart(binder bind: ReceiptBinder<Coordinator>) -> BindingReceipt<Coordinator> {
//            return bind.to(factory: BaseCoordinator.init)
//        }
    }
}
