//
//  AppDelegate.swift
//  TheMovieDB
//
//  Created by William on 26/09/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit
import Swinject
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    static let container = Container()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppDelegate.container.registerDependencies()
        let coordinator = AppDelegate.container.resolve(AppCoordinator.self)
        coordinator?.start()
        return true
    }
}

// MARK: - Inject Properties
extension AppDelegate {
    func injectProperties(_ window: UIWindow) {
        self.window = window
    }
}
