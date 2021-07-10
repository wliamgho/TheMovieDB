//
//  Coordinator.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation

protocol Coordinator: AnyObject {
    func start()
    func finishFlow(_ coordinator: Coordinator)
//    func finishFlow(_: () -> Void)
}
