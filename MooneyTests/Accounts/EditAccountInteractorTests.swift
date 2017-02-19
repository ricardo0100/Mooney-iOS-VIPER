//
//  EditAccountInteractorTests.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 17/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import XCTest
import DATAStack

@testable import Mooney

class EditAccountInteractorTests: XCTestCase {
    
    var interactor: EditAccountInteractor!
    var presenter: EditAccountInteractorOutputDouble!
    var dataStack: DATAStack!
    
    override func setUp() {
        dataStack = DATAStack(modelName: "MooneyDataModel", storeType: .inMemory)
        interactor = EditAccountInteractor(dataStack: dataStack)
        presenter = EditAccountInteractorOutputDouble()
        interactor.output = presenter
    }
    
    func testPresentValidationErrorForEmptyName() {
        interactor.save(account: nil, with: "")
        
        XCTAssertTrue(presenter.didPresentValidationError)
    }
    
    func testPresentSuccess() {
        interactor.save(account: nil, with: "Banco do Brasil")
        let accounts = DatabaseUtils.fetchAccounts(in: dataStack.mainContext)
        
        XCTAssertTrue(presenter.didPresentSuccess)
        XCTAssertEqual(accounts.count, 1)
    }
    
    func testPresentSuccessForEditedAccount() {
        let account = DatabaseUtils.createAccount(with: "Banco do Brasil", in: dataStack.mainContext)
        interactor.save(account: account, with: "Santander")
        let accounts = DatabaseUtils.fetchAccounts(in: dataStack.mainContext)
        XCTAssertEqual(accounts[0].name, "Santander")
    }
    
    func testPresentValidationErrorForEmptyNameForEditedAccount() {
        let account = DatabaseUtils.createAccount(with: "Banco do Brasil", in: dataStack.mainContext)
        interactor.save(account: account, with: "")
        XCTAssertTrue(presenter.didPresentValidationError)
    }
    
    func testNewAccountGetDiscartedAfterValidationErrorAndCancelation() {
        interactor.save(account: nil, with: "")
        let accounts = DatabaseUtils.fetchAccounts(in: dataStack.mainContext)
        XCTAssertEqual(accounts.count, 0)
    }
    
}
