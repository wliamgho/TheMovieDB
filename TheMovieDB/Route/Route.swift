//
//  Route.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import UIKit

protocol Presentable: AnyObject {
    func createModule() -> UIViewController?
}

extension UIViewController: Presentable {
    func createModule() -> UIViewController? {
        return self
    }
}

protocol Route: Presentable {
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    func presentTopModule(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, hideBottomBar: Bool)
    func push(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
    func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: (() -> Void)?)
    func popModule()
    func popModule(animated: Bool)
    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    func dismissTopModule(animated: Bool, completion: (() -> Void)?)
    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)
    func popToRootModule(animated: Bool)
}
