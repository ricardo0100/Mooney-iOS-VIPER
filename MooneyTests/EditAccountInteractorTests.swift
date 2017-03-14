//
//  EditAccountInteractorTests.swift
//  MooneyTests
//
//  Created by Ricardo Gehrke Filho on 12/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import XCTest
import RealmSwift

@testable import Mooney

class EditAccountInteractorTests: XCTestCase {
    
    var interactor: EditAccountInteractorInput!
    var output: EditAccountInteractorOutputDouble!
    var realm: Realm!
    var databaseHelper: DatabaseHelper!
    
    override func setUp() {
        super.setUp()
        
        realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "UnitTestRealm"))
        databaseHelper = DatabaseHelper(with: realm)
        
        let interactor = EditAccountInteractor(with: realm)
        self.interactor = interactor
        output = EditAccountInteractorOutputDouble()
        interactor.output = output
    }
    
    override func tearDown() {
        try! realm.write {
            realm.deleteAll()
        }
        super.tearDown()
    }
    
    func testDidPresentBlankAccountForEdition() {
        interactor.prepareNewItemForEdition()
        interactor.presentItem()
        XCTAssertEqual(output.name, "")
        XCTAssertEqual(output.title, "New account")
        
    }
    
    func testDidPresentExistingAccountForEdition() {
        let id = databaseHelper.addAccountWith(name: "Foo Bank")
        interactor.prepareForEditionItem(with: id)
        interactor.presentItem()
        XCTAssertEqual(output.name, "Foo Bank")
        XCTAssertEqual(output.title, "Foo Bank")
    }
    
    func testSaveNewItemDidPresentSuccess() {
        interactor.saveAccountWithName(name: "Foo Bank")
        XCTAssertTrue(output.didCallSuccessCallback)
    }
    
    func testSaveNewItemDidSaveIntoDatabase() {
        interactor.saveAccountWithName(name: "Foo Bank")
        XCTAssertEqual(databaseHelper.getAllAccounts().first!.name, "Foo Bank")
    }
    
    func testSaveExistingItemDidSaveIntoCorrectObjectInDatabase() {
        let id = databaseHelper.addAccountWith(name: "Foo Bank")
        interactor.prepareForEditionItem(with: id)
        interactor.saveAccountWithName(name: "Bar Bank")
        XCTAssertEqual(databaseHelper.getAllAccounts().count, 1)
        XCTAssertEqual(databaseHelper.getAllAccounts().first!.name, "Bar Bank")
    }
    
    func testShouldPresentErrorForEmptyName() {
        interactor.saveAccountWithName(name: "")
        XCTAssertEqual(output.errorField, "name")
        XCTAssertNotNil(output.fieldErrorMessage)
    }
    
    func testShouldNotSaveAccountWithEmptyNameInDatabase() {
        interactor.saveAccountWithName(name: "")
        XCTAssertEqual(databaseHelper.getAllAccounts().count, 0)
    }
    
    
    //MARK: Test Doubles
    
    class EditAccountInteractorOutputDouble: EditAccountInteractorOutput {
        
        var didCallSuccessCallback = false
        func successCallback() {
            didCallSuccessCallback = true
        }
        
        var errorMessage: String?
        func presentError(with title: String, and message: String) {
            errorMessage = message
        }
        
        var title: String?
        var name: String?
        func presentItemForEditionWith(title: String, name: String) {
            self.title = title
            self.name = name
        }
        
        var errorField: String?
        var fieldErrorMessage: String?
        func presentError(for field: String, with message: String?) {
            self.errorField = field
            self.fieldErrorMessage = message
        }
        
    }
    
}

