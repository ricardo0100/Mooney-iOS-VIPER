//
//  MooneyTests.swift
//  MooneyTests
//
//  Created by Ricardo Gehrke Filho on 14/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import XCTest

@testable import Mooney

class AccountsInteractorTests: XCTestCase {
    
    var interactor: AccountsInteractor!
    var presenter: AccountsInteractorOutputDouble!
    
    override func setUp() {
        interactor = AccountsInteractor()
        presenter = AccountsInteractorOutputDouble()
        interactor.output = presenter
    }
    
    func testEmptyList() {
        interactor.showAccountsList()
        XCTAssertTrue(presenter.didPresentBlankstate)
    }
    
}
