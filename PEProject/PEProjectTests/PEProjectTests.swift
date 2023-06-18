//
//  PEProjectTests.swift
//  PEProjectTests
//
//  Created by Denis Kovalev on 17.06.2023.
//

import XCTest
@testable import PEProject

final class PEProjectTests: XCTestCase {
    func testLoginValidatorSuccess() throws {
        let loginValidator = LoginValidator()
        XCTAssertTrue(loginValidator.validate(login: "root", password: "1234"))
    }

    func testLoginValidatorRandomFailure() throws {
        let loginValidator = LoginValidator()
        XCTAssertFalse(loginValidator.validate(login: "1", password: "1"))
    }

    func testLoginValidatorEmptyFailure() throws {
        let loginValidator = LoginValidator()
        XCTAssertFalse(loginValidator.validate(login: "", password: ""))
    }
}
