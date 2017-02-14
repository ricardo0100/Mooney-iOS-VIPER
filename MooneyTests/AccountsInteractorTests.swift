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
    
    override func setUp() {
        interactor = AccountsInteractor(dataStack: DATAStack(modelName: "MooneyDataModel", storeType: .inMemory))
        presenter = AccountsInteractorOutputDouble()
        interactor.output = presenter
    }
    
    func testEmptyList() {
        interactor.showAccountsList()
        XCTAssertTrue(presenter.didPresentBlankstate)
        XCTAssertEqual(presenter.accountsList.count, 0)
    }
    
    
    
}
