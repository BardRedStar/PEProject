//
//  PEProjectUITests.swift
//  PEProjectUITests
//
//  Created by Denis Kovalev on 17.06.2023.
//

import XCTest

final class PEProjectUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        let loginField = app.textFields["login_field"]
        loginField.tap()
        loginField.typeText("root")


        let passwordField = app.secureTextFields["password_field"]
        passwordField.tap()
        passwordField.typeText("1234")

        app.otherElements["view"].tap()

        app.buttons["login_button"].waitForExistence(timeout: 2)
        app.buttons["login_button"].tap()

        app.staticTexts["Success"]
    }
}


