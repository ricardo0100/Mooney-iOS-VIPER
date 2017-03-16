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
    
    var interactor: ListAccountsInteractorInput!
    var realm: Realm!
    var databaseHelper: DatabaseHelper!
    
    override func setUp() {
        super.setUp()
        realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "UnitTestRealm"))
        databaseHelper = DatabaseHelper(with: realm)
        let interactor = ListAccountsInteractor(with: realm)
        interactor.output = ListAccountsInteractorOutputStub()
        self.interactor = interactor
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
    
    func testDidPresentTwoItems() {
        _ = databaseHelper.addAccountWith(name: "Foo Bank")
        _ = databaseHelper.addAccountWith(name: "Bar Bank")
        interactor.fetchItems()
        XCTAssertEqual(interactor.numberOfItems(), 2)
    }
    
    func testDidDeleteItem() {
        _ = databaseHelper.addAccountWith(name: "Foo Bank")
        _ = databaseHelper.addAccountWith(name: "Bar Bank")
        interactor.fetchItems()
        interactor.deleteItem(at: 0)
        XCTAssertEqual(interactor.numberOfItems(), 1)
    }
    
    func testDidFilterItems() {
        _ = databaseHelper.addAccountWith(name: "Foo Bank")
        _ = databaseHelper.addAccountWith(name: "Bar Bank")
        interactor.fetchItems()
        interactor.filterItems(with: "Foo")
        XCTAssertEqual(interactor.numberOfItems(), 1)
        XCTAssertEqual(interactor.itemName(at: 0), "Foo Bank")
    }
    
    func testDidShowAllItemsWithEmptySearchText() {
        _ = databaseHelper.addAccountWith(name: "Foo Bank")
        _ = databaseHelper.addAccountWith(name: "Bar Bank")
        interactor.fetchItems()
        interactor.filterItems(with: "")
        XCTAssertEqual(interactor.numberOfItems(), 2)
    }
    
    
    //MARK: Test Doubles
    
    class ListAccountsInteractorOutputStub: ListAccountsInteractorOutput {
        
        func didFetchItems() { }
        
    }
    
}

