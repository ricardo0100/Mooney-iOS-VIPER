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
    
    var interactor: EditAccountInteractor!
    var output: EditAccountInteractorOutputDouble!
    var realm: Realm!
    var databaseHelper: DatabaseHelper!
    
    override func setUp() {
        super.setUp()
        realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "UnitTestRealm"))
        databaseHelper = DatabaseHelper(with: realm)
        interactor = EditAccountInteractor(with: realm)
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
        XCTAssertNotNil(output.accountStruct)
        XCTAssertNil(output.accountStruct!.id)
        XCTAssertEqual(output.accountStruct!.name, "")
    }
    
    func testDidPresentExistingAccountForEdition() {
        let id = databaseHelper.addAccountWith(name: "Foo Bank")
        interactor.prepareForEditionItem(with: id)
        XCTAssertNotNil(output.accountStruct)
        XCTAssertNotNil(output.accountStruct!.id)
        XCTAssertEqual(output.accountStruct!.name, "Foo Bank")
    }
    
    func testSaveNewItemDidPresentSuccess() {
        interactor.saveItemWith(itemStruct: AccountStruct(id: nil, name: "Foo Bank"))
        XCTAssertTrue(output.didCallSuccessCallback)
    }
    
    func testSaveNewItemDidSaveObjectInRealm() {
        interactor.saveItemWith(itemStruct: AccountStruct(id: nil, name: "Foo Bank"))
        let realmObject = realm.objects(Account.self)[0]
        XCTAssertEqual(realmObject.name, "Foo Bank")
    }
    
    
    //MARK: Test Doubles
    
    class EditAccountInteractorOutputDouble: EditAccountInteractorOutput {
        
        var didCallSuccessCallback = false
        func successCallback() {
            didCallSuccessCallback = true
        }
        
        var errorMessage: String?
        func presentError(with message: String) {
            errorMessage = message
        }
        
        var accountStruct: AccountStruct?
        func presentItemForEdition(itemStruct: BaseStruct) {
            accountStruct = itemStruct as? AccountStruct
        }
        
    }
    
}
