//
//  Coordinator+DI.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation
import Cleanse

protocol CoordinatorInterfaceModule: Module {
    static func configureStart(binder bind: ReceiptBinder<Coordinator>) -> BindingReceipt<Coordinator>
}
