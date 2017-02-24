//
//  ListResourcesPresenterTests.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 22/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import XCTest
import DATAStack

@testable import Mooney

class ListResourcesPresenterTests: XCTestCase {
    
    var dataStack: DATAStack!
    var presenter: ListResourcesPresenter<Account, AccountModel>!
    var view: ListResourcesViewInputDouble!
    
    override func setUp() {
        dataStack = DATAStack(modelName: "MooneyDataModel", storeType: .inMemory)
        presenter = ListResourcesPresenter<Account, AccountModel>()
        presenter.interactor = ListResourcesInteractor<AccountModel>(with: dataStack, andEntityName: "Account")
        presenter.interactor.output = presenter
        view = ListResourcesViewInputDouble()
        presenter.view = view
    }
    
    func testPresentBlankstate() {
        presenter.refreshResourcesList()
        
        XCTAssertTrue(view.didShowBlankstate)
    }
    
    func testPresentListWithOneItem() {
        DatabaseUtils.createAccount(with: "Banco do Brasil", in: dataStack.mainContext)
        presenter.refreshResourcesList()
        
        XCTAssertTrue(view.didShowList)
        XCTAssertEqual(presenter.numberOfItems(), 1)
    }
    
    func testPresentListWithTwoItems() {
        DatabaseUtils.createAccount(with: "Banco do Brasil", in: dataStack.mainContext)
        DatabaseUtils.createAccount(with: "Banco do Canadá", in: dataStack.mainContext)
        presenter.refreshResourcesList()
        
        XCTAssertTrue(view.didShowList)
        XCTAssertEqual(presenter.numberOfItems(), 2)
    }
    
    func testPresentListWithCorrectItem() {
        DatabaseUtils.createAccount(with: "Banco do Brasil", in: dataStack.mainContext)
        presenter.refreshResourcesList()
        
        let account = presenter.resourceForItem(at: 0) as! Account
        XCTAssertEqual(account.name, "Banco do Brasil")
    }
    
    func testPresenterDidRemoveResourceFromView() {
        DatabaseUtils.createAccount(with: "Banco do Brasil", in: dataStack.mainContext)
        DatabaseUtils.createAccount(with: "Banco do Canadá", in: dataStack.mainContext)
        presenter.refreshResourcesList()
        presenter.didTapDeleteActionFotItem(at: 0)
        XCTAssertEqual(presenter.numberOfItems(), 1)
    }
    
}
