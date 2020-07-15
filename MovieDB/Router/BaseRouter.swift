//
//  BaseRouter.swift
//  MovieDB
//
//  Created by William on 14/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

final class BaseRouter: NSObject {
  private weak var rootController: UINavigationController?
  private var completions: [UIViewController : () -> Void] = [:]
  private var transition: UIViewControllerInteractiveTransitioning?

  init(rootController: UINavigationController) {
    self.rootController = rootController
  }

  private func withCompletion(controller: UIViewController) {
    guard let completion = completions[controller] else { return }
    completion()
    completions.removeValue(forKey: controller)
  }
}

extension BaseRouter: Router {
  func toPresent() -> UIViewController? {
    return rootController
  }

  func present(_ module: Presentable?) {
    present(module, animated: true)
  }

  func present(_ module: Presentable?, animated: Bool) {
    guard let controller = module?.toPresent() else { return }
    controller.present(controller, animated: animated, completion: nil)
  }

  func push(_ module: Presentable?) {
    push(module, animated: true)
  }
  
  func push(_ module: Presentable?, hideBottomBar: Bool) {
    push(module, animated: true, hideBottomBar: hideBottomBar, completion: nil)
  }
  
  func push(_ module: Presentable?, animated: Bool) {
    push(module, animated: animated, completion: nil)
  }
  
  func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?) {
    push(module, animated: animated, hideBottomBar: false, completion: completion)
  }
  
  func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: (() -> Void)?) {
    guard let controller = module?.toPresent(),
      (controller is UINavigationController == false) else { return }
    
    if let completion = completion {
      completions[controller] = completion
    }

    controller.hidesBottomBarWhenPushed = hideBottomBar
    rootController?.pushViewController(controller, animated: animated)
  }
  
  func popModule() {
    popModule(animated: true)
  }
  
  func popModule(animated: Bool) {
    if let controller = rootController?.popViewController(animated: animated) {
      withCompletion(controller: controller)
    }
  }
  
  func dismissModule() {
    dismissModule(animated: true, completion: nil)
  }
  
  func dismissModule(animated: Bool, completion: (() -> Void)?) {
    rootController?.dismiss(animated: animated, completion: completion)
  }
  
  func setRootModule(_ module: Presentable?) {
    setRootModule(module, hideBar: false)
  }
  
  func setRootModule(_ module: Presentable?, hideBar: Bool) {
    guard let controller = module?.toPresent() else { return }
    rootController?.setViewControllers([controller], animated: false)
    rootController?.isNavigationBarHidden = hideBar
  }
  
  func popToRootModule(animated: Bool) {
    if let controllers = rootController?.popToRootViewController(animated: animated) {
      controllers.forEach { controller in
        withCompletion(controller: controller)
      }
    }
  }
}

extension BaseRouter: UINavigationControllerDelegate {
  func navigationController(_ navigationController: UINavigationController,
                            interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    self.transition
  }
}
