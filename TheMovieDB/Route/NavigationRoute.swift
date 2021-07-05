//
//  NavigationRoute.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import UIKit

final class NavigationRoute: NSObject, Route {
    private weak var rootController: UINavigationController?
    private var completions: [UIViewController: () -> Void] = [:]

//    init(rootController: UINavigationController) {
//        self.rootController = rootController
//        completions = [:]
//    }
    init(window: UIWindow) {
        let navigationController = UINavigationController()
        rootController = navigationController
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        completions = [:]
    }

    func createModule() -> UIViewController? {
        return rootController
    }

    func present(_ module: Presentable?) {
        present(module, animated: true)
    }
    
    func present(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.createModule() else { return }
        rootController?.present(controller, animated: animated, completion: nil)
    }
    
    func presentTopModule(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.createModule() else { return }
        rootController?.visibleViewController?.present(controller, animated: animated, completion: nil)
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
        guard let controller = module?.createModule(),
              (controller is UINavigationController == false)
        else {
            Log.info("UINavigationController is nil")
            return
        }
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
            removeCompletion(for: controller)
        }
    }
    
    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        rootController?.dismiss(animated: animated, completion: completion)
    }
    
    func dismissTopModule(animated: Bool, completion: (() -> Void)?) {
        rootController?.visibleViewController?.dismiss(animated: animated, completion: nil)
    }
    
    func setRootModule(_ module: Presentable?) {
        setRootModule(module, hideBar: false)
    }
    
    func setRootModule(_ module: Presentable?, hideBar: Bool) {
        guard let controller = module?.createModule() else { return }
        rootController?.setViewControllers([controller], animated: false)
        rootController?.isNavigationBarHidden = hideBar
    }
        
    func popToRootModule(animated: Bool) {
        if let controllers = rootController?.popToRootViewController(animated: animated) {
            controllers.forEach { controller in
                removeCompletion(for: controller)
            }
        }
    }

    private func removeCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
}
