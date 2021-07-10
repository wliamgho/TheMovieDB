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
    private let container = Container()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let route = NavigationRoute(window: window!)
        let container = AppDIContainer()
        let coordinator = AppCoordinator(route: route, container: container)
        coordinator.start()
        window?.makeKeyAndVisible()
        return true
    }
}

// MARK: - Inject Properties
extension AppDelegate {
    func injectProperties(_ window: UIWindow) {
        self.window = window
    }
}
