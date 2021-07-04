//
//  Responsable.swift
//  TheMovieDB
//
//  Created by William on 04/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation

protocol Responsable {
    var decoder: JSONDecoder { get }
}

extension Responsable {
    var decoder: JSONDecoder {
        return JSONDecoder()
    }
}
