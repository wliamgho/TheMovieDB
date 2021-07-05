//
//  Route+DI.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation
import Cleanse

protocol RouteCreateModule: Module {
    static func configurePresentableModule(binder bind: ReceiptBinder<Presentable>) -> BindingReceipt<Presentable>
    static func configureRouteModule(binder bind: ReceiptBinder<Route>) -> BindingReceipt<Route>
}
