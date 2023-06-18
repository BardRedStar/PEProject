//
//  LoginValidator.swift
//  PEProject
//
//  Created by Denis Kovalev on 17.06.2023.
//

import Foundation

class LoginValidator {

    private enum Constants {
        static let validLogin = "root"
        static let validPassword = "1234"
    }

    func validate(login: String, password: String) -> Bool {
        login == Constants.validLogin && password == Constants.validPassword
    }
}
