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
        XCTAssertEqual(output.accountName, "")
        XCTAssertEqual(output.title, "New account")
        
    }
    
    func testDidPresentExistingAccountForEdition() {
        let id = databaseHelper.addAccountWith(name: "Foo Bank")
        interactor.prepareForEditionItem(with: id)
        interactor.presentItem()
        XCTAssertEqual(output.accountName, "Foo Bank")
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
        func setTitle(title: String) {
            self.title = title
        }
        
        var accountName: String?
        func presentItemForEditionWith(name: String) {
            accountName = name
        }
        
    }
    
}
