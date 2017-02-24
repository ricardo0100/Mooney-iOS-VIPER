//
//  ListResourcesInteractorTests.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 21/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import XCTest
import DATAStack

@testable import Mooney

class ListResourcesInteractorTests: XCTestCase {
    
    var interactor: ListResourcesInteractor<AccountModel>!
    var output: ListResourcesInteractorOutputDouble!
    
    override func setUp() {
        interactor = ListResourcesInteractor<AccountModel>(with: DATAStack(modelName: "MooneyDataModel", storeType: .inMemory), andEntityName:"Account")
        output = ListResourcesInteractorOutputDouble()
        interactor.output = output
    }
    
    func testListResourcesInteractorOutputDidPresentBlankState() {
        interactor.fetchList()
        
        XCTAssertEqual(output.presentedList.count, 0, "List should be empty!")
        XCTAssertFalse(output.didPresentError)
    }
    
    func testListResourcesInteractorOutputDidPresentList() {
        DatabaseUtils.createAccount(with: "Banco do Brasil 🇧🇷", in: interactor.dataStack.mainContext)
        interactor.fetchList()
        
        XCTAssertEqual(output.presentedList.count, 1, "List should have one item!")
        XCTAssertFalse(output.didPresentError)
    }
    
    func testListResourceInteractorDidDeleteResource() {
        DatabaseUtils.createAccount(with: "Banco do Brasil 🇧🇷", in: interactor.dataStack.mainContext)
        interactor.fetchList()
        
        XCTAssertTrue(interactor.deleteResource(output.presentedList[0]))
        
        interactor.fetchList()
        XCTAssertEqual(output.presentedList.count, 0, "List should be empty!")
    }
    
}
