//
//  AppDelegate.swift
//  MovieDB
//
//  Created by William on 21/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  private var appDIContainer = AppDIContainer()
  private var appFlowCoordinator: AppFlowCoordinator?
  private var rootController = UINavigationController()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    setRootViewController()
    return true
  }

  private func setRootViewController() {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = rootController
    appFlowCoordinator = AppFlowCoordinator(router: BaseRouter(rootController: rootController),
                                            DIContainer: appDIContainer)
    appFlowCoordinator?.start()
    window?.makeKeyAndVisible()
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    MovieDBCoreData.shared.saveContext()
  }
}

