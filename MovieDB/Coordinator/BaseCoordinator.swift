//
//  BaseCoordinator.swift
//  MovieDB
//
//  Created by William on 14/07/20.
//  Copyright © 2020 William. All rights reserved.
//

class BaseCoordinator: Coordinator {
  var childCoordinators: [Coordinator] = []

  func start() {
    start(with: nil)
  }

  func start(with option: DeeplinkPath?) { }

  func addDependency(_ coordinator: Coordinator) {
    guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }

    childCoordinators.append(coordinator)
  }

  func removeDependency(_ coordinator: Coordinator?) {
    guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }

    if let coordinator = coordinator as? BaseCoordinator,
      !coordinator.childCoordinators.isEmpty {
      coordinator.childCoordinators
        .filter({ $0 !== coordinator })
        .forEach({ coordinator.removeDependency($0) })
    }

    for (index, element) in childCoordinators.enumerated() where element === coordinator {
      childCoordinators.remove(at: index)
      break
    }
  }
}
