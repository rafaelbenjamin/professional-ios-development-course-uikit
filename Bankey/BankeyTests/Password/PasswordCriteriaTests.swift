//
//  PasswordCriteriaTests.swift
//  BankeyTests
//
//  Created by Rafael Benjamin on 18/08/22.
//

import XCTest

@testable import Bankey

class PasswordLengthCriteriaTests: XCTestCase {
    
    // Boundary conditions 8-32
    
    func testShort() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("1234567"))
    }
    
    func testLong() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("123456789012345678901234567890123"))
    }
    
    func testValidShort() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678"))
    }
    
    func testValidLong() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678901234567890123456789012"))
    }
}

class PasswordOtherCriteriaTests: XCTestCase {
    func testSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpaceCriteriaMet("abc"))
    }
    
    func testSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.noSpaceCriteriaMet("a bc"))
    }
    
    func testlenghtAndNoSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lengthAndNoSpaceMet("abcdefg h"))
    }
    
    func testlenghtAndNoSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.lengthAndNoSpaceMet("abcdefgh"))
    }
    
    func testuppercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.uppercaseMet("abc"))
    }
    
    func testuppercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.uppercaseMet("ABC"))
    }
          
    func testlowercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lowercaseMet("ABC"))
    }
    
    func testlowercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.lowercaseMet("abc"))
    }
    
    func testdigitNotMet() throws {
        XCTAssertFalse(PasswordCriteria.digitMet("abc"))
    }
    
    func testdigitMet() throws {
        XCTAssertTrue(PasswordCriteria.digitMet("123"))
    }
        
    func testspecialCharacterNotMet() throws {
        XCTAssertFalse(PasswordCriteria.specialCharacterMet("abc"))
    }
    
    func testspecialCharacterMet() throws {
        XCTAssertTrue(PasswordCriteria.specialCharacterMet("@:"))
    }
}
