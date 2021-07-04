//
//  NetworkSession+DI.swift
//  TheMovieDB
//
//  Created by William on 04/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation
import Cleanse

extension NetworkSession {
    struct Module: Cleanse.Module {
        static func configure(binder: Binder<Unscoped>) {
            binder.bind(SessionRequest.self).to(factory: NetworkSession.init)
        }
    }
}
