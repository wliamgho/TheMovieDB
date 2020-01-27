//
//  LoginViewModel.swift
//  MovieDB
//
//  Created by William on 22/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

protocol LoginViewModelDelegate: class {
  func fieldStatus(status: Bool)
}

class LoginViewModel {
  weak var delegate: LoginViewModelDelegate?

  init() {}

  func checkUsernameField(text: String?) {
    if text == "" || text == nil {
      delegate?.fieldStatus(status: false)
    } else {
      delegate?.fieldStatus(status: true)
    }
  }

}
