//
//  LoginModule.swift
//  Login
//
//  Created by William on 27/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import ModuleManager
import UIKit

public class LoginModule: LoginModuleManageable {
  public init() {}
  
  public func loginView() -> UIViewController {
    let bundle = Bundle(for: LoginModule.self)
    return LoginViewController(nibName: "LoginViewController", bundle: bundle)
  }
}
