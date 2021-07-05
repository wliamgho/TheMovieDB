//
//  NavigationRoute+DI.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import UIKit
import Cleanse

extension NavigationRoute {
    struct Module: RouteCreateModule {
        static func configure(binder: UnscopedBinder) {
            binder.bind().to(factory: NavigationRoute.init)
        }

        static func configurePresentableModule(binder bind: ReceiptBinder<Presentable>) -> BindingReceipt<Presentable> {
            bind.to(factory: NavigationRoute.init)
        }

        static func configureRouteModule(binder bind: ReceiptBinder<Route>) -> BindingReceipt<Route> {
            bind.to(factory: NavigationRoute.init)
        }
    }
}
