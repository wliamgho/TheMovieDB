//
//  LoginViewController.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController {
    private lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.text = "Login Authorization"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    private lazy var emailField: RoundTextField = {
        let field = RoundTextField()
        field.placeholder = "Email"
        field.keyboardType = .emailAddress
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    private lazy var passwordField: RoundTextField = {
        let field = RoundTextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    private lazy var loginButton: FormButton = {
        let button = FormButton(type: .custom)
        button.setTitle("Log In", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var viewModel: LoginViewModel?
    private let disposeBag = DisposeBag()

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraint()
        bindViewModel()
    }
}

private extension LoginViewController {
    private func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(headerTitle)
        self.view.addSubview(stackView)
        stackView.addArrangedSubviews(emailField, passwordField, loginButton)
        stackView.setCustomSpacing(24, after: passwordField)
    }

    private func setupConstraint() {
        NSLayoutConstraint.activate([
            // HeaderTitle
            headerTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 24),
            headerTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            // StackView
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            // EmailField
            emailField.heightAnchor.constraint(equalToConstant: 40),
            // PasswordField
            passwordField.heightAnchor.constraint(equalToConstant: 40),
            // LoginButton
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func bindViewModel() {
        viewModel?.didLogin(email: emailField.rx.text.orEmpty.asObservable(),
                            password: passwordField.rx.text.orEmpty.asObservable(),
                            loginAction: loginButton.rx.tap.asObservable())
        viewModel?.isLogin.drive(loginButton.rx.isEnabled).disposed(by: disposeBag)
    }
}
