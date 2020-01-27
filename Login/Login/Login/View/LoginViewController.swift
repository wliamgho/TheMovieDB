//
//  LoginViewController.swift
//  MovieDB
//
//  Created by William on 22/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit
import ModuleManager
import MovieList

class LoginViewController: UIViewController {
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var errorLabel: UILabel!

  var viewModel = LoginViewModel()

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    usernameTextField.text = ""

    self.navigationController?.setNavigationBarHidden(true, animated: animated)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    viewModel.delegate = self
  }

  @IBAction func loginDidTapped(_ sender: Any) {
    viewModel.checkUsernameField(text: usernameTextField.text)
  }
}

extension LoginViewController: LoginViewModelDelegate {
  func fieldStatus(status: Bool) {
    DispatchQueue.main.async { [weak self] in
      self?.usernameTextField.resignFirstResponder()

      self?.errorLabel.isHidden = status
      self?.errorLabel.text = status == true ? "" : "Username can't be empty"

      if status == true {
        guard let movieVC = ModuleManager.shared.module(withType: MovieListModuleManageable.self)?.movieListVC() else {
          fatalError("Not Registered module")
        }

        self?.navigationController?.setViewControllers([movieVC], animated: true)
      }

    }
  }
}
