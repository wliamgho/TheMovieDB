//
//  ModuleManager.swift
//  ModuleManager
//
//  Created by William on 27/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

public final class ModuleManager {
  // Singleton object
  public static let shared = ModuleManager()

  // List of modules registered
  private var modules = [Any]()

  // Register a list of modules
  public func register(modules: [Any]) {
    self.modules = modules
  }

  // Method to access a module using ModuleManagable Protocols
  public func module<T>(withType type: T.Type) -> T? {
    for module in modules {
      if module is T {
        return module as? T
      }
    }

    return nil
  }
}
