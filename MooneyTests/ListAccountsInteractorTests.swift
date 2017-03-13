//
//  ListAccountsInteractorTests.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 12/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import XCTest
import RealmSwift

@testable import Mooney

class ListAccountsInteractorTests: XCTestCase {
    
    var interactor: ListAccountsInteractor!
    var realm: Realm!
    var databaseHelper: DatabaseHelper!
    
    override func setUp() {
        super.setUp()
        realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "UnitTestRealm"))
        databaseHelper = DatabaseHelper(with: realm)
        interactor = ListAccountsInteractor(with: realm)
        interactor.output = ListAccountsInteractorOutputStub()
    }
    
    override func tearDown() {
        try! realm.write {
            realm.deleteAll()
        }
        super.tearDown()
    }
    
    func testDidPresentNoItems() {
        interactor.fetchItems()
        XCTAssertEqual(interactor.numberOfItems(), 0)
    }
    
    func testDidPresentOneItem() {
        _ = databaseHelper.addAccountWith(name: "Foo Bank")
        interactor.fetchItems()
        XCTAssertEqual(interactor.numberOfItems(), 1)
    }
    
    func testDidPresentOneItemWithCorrectName() {
        _ = databaseHelper.addAccountWith(name: "Foo Bank")
        interactor.fetchItems()
        XCTAssertEqual(interactor.itemName(at: 0), "Foo Bank")
    }
    
    func testDidDeleteItem() {
        _ = databaseHelper.addAccountWith(name: "Foo Bank")
        _ = databaseHelper.addAccountWith(name: "Bar Bank")
        interactor.fetchItems()
        XCTAssertEqual(interactor.numberOfItems(), 2)
        interactor.deleteItem(at: 0)
        XCTAssertEqual(interactor.numberOfItems(), 1)
    }
    
    
    //MARK: Test Doubles
    
    class ListAccountsInteractorOutputStub: ListAccountsInteractorOutput {
        
        func didFetchItems() { }
        
    }
    
}

