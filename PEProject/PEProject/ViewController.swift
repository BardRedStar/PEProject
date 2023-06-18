//
//  ViewController.swift
//  PEProject
//
//  Created by Denis Kovalev on 17.06.2023.
//

import UIKit

class ViewController: UIViewController {
    // UI elements
    private let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let loginTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your login"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textContentType = .nickname
        textField.accessibilityIdentifier = "login_field"
        return textField
    }()

    private let passwordTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textContentType = .password
        textField.accessibilityIdentifier = "password_field"
        return textField
    }()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "login_button"
        return button
    }()

    private lazy var validationLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        label.textColor = .darkText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let loginValidator = LoginValidator()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.accessibilityIdentifier = "view"

        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(viewTapped))
        view.addGestureRecognizer(recognizer)

        setupUI()
    }

    private func setupUI() {
        // Add subviews
        view.addSubview(signInLabel)
        view.addSubview(loginTitleLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTitleLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(validationLabel)


        // Set up constraints
        NSLayoutConstraint.activate([
            signInLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            signInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            loginTitleLabel.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 16),
            loginTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            loginTextField.topAnchor.constraint(equalTo: loginTitleLabel.bottomAnchor, constant: 8),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            passwordTitleLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 16),
            passwordTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            passwordTextField.topAnchor.constraint(equalTo: passwordTitleLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            validationLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 24),
            validationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // Set up target action for the login button
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }

    @objc private func loginButtonTapped() {
        let login = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        let isValid = loginValidator.validate(login: login, password: password)
        validationLabel.text = isValid ? "Success" : "Failure"
    }

    @objc private func viewTapped() {
        view.endEditing(true)
    }
}
