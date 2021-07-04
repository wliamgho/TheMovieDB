//
//  AppDI+module.swift
//  TheMovieDB
//
//  Created by William on 04/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation
import Cleanse

extension AppDI {
    struct Module: Cleanse.RootComponent {
        typealias Root = PropertyInjector<AppDelegate>
        typealias Scope = Singleton

        static func configure(binder: SingletonBinder) {
            binder.include(module: NetworkModule.self)
        }

        static func configureRoot(binder bind: ReceiptBinder<Root>) -> BindingReceipt<Root> {
            return bind.propertyInjector(configuredWith: AppDI.Module.configureAppDelegateInjector(binder:))
        }

        static func configureAppDelegateInjector(binder bind: PropertyInjectionReceiptBinder<AppDelegate>) -> BindingReceipt<PropertyInjector<AppDelegate>> {
            return bind.to(injector: AppDelegate.injectProperties)
        }
    }
}
