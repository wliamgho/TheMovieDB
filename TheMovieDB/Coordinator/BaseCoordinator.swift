//
//  BaseCoordinator.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation

class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []

    func start() {
        preconditionFailure("Needs to be overriden by subclass")
    }

    func finishFlow(_ coordinator: Coordinator) {
        self.removeChild(coordinator)
    }

    func addChild(_ coordinator: Coordinator) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinator) {
        guard childCoordinators.isEmpty == false else {
            print("Could not remove: \(coordinator). It's not a child coordinator")
            return
        }

        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }

    func removeAllChildCoordinator() {
        childCoordinators.removeAll()
    }
}
