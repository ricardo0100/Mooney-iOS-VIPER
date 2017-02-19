//
//  MooneyTests.swift
//  MooneyTests
//
//  Created by Ricardo Gehrke Filho on 14/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import XCTest
import DATAStack

@testable import Mooney

class AccountsInteractorTests: XCTestCase {
    
    var interactor: AccountsInteractor!
    var presenter: AccountsInteractorOutputDouble!
    var dataStack: DATAStack!
    
    override func setUp() {
        dataStack = DATAStack(modelName: "MooneyDataModel", storeType: .inMemory)
        interactor = AccountsInteractor(dataStack: dataStack)
        presenter = AccountsInteractorOutputDouble()
        interactor.output = presenter
    }
    
    func testPresentEmptyList() {
        interactor.fetchAccountsList()
        
        XCTAssertTrue(presenter.didPresentBlankstate)
        XCTAssertEqual(presenter.presentedAccounts.count, 0)
    }
    
    func testPresentOneAccount() {
        _ = DatabaseUtils.createAccount(with: "Banco do Brasil", in: dataStack.mainContext)
        interactor.fetchAccountsList()
        
        XCTAssertTrue(presenter.didPresentAccountsList)
        XCTAssertEqual(presenter.presentedAccounts.count, 1)
        XCTAssertEqual(presenter.presentedAccounts[0].name, "Banco do Brasil")
    }
    
}
