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
        DatabaseUtils.createAccount(with: "Banco do Brasil 🇧🇷", in: interactor.dataStack.mainContext, and: NSDate())
        interactor.fetchList()
        
        XCTAssertEqual(output.presentedList.count, 1, "List should have one item!")
        XCTAssertFalse(output.didPresentError)
    }
    
    func testListResourceInteractorDidDeleteResource() {
        DatabaseUtils.createAccount(with: "Banco do Brasil 🇧🇷", in: interactor.dataStack.mainContext, and: NSDate())
        interactor.fetchList()
        
        XCTAssertTrue(interactor.deleteResource(output.presentedList[0]))
        
        interactor.fetchList()
        XCTAssertEqual(output.presentedList.count, 0, "List should be empty!")
    }
    
    func testListResourceInteractorDidPresentListOrderedByUpdateTime() {
        let now = NSDate()
        DatabaseUtils.createAccount(with: "Banco do Brasil", in: interactor.dataStack.mainContext, and: now)
        DatabaseUtils.createAccount(with: "Banco do Canadá", in: interactor.dataStack.mainContext, and: now.addingTimeInterval(1))
        interactor.fetchList()
        
        let account0 = output.presentedList[0] as! AccountModel
        let account1 = output.presentedList[1] as! AccountModel
        
        XCTAssertEqual(account0.name!, "Banco do Canadá")
        XCTAssertEqual(account1.name!, "Banco do Brasil")
    }
    
    //MARK: Doubles
    
    class ListResourcesInteractorOutputDouble: ListResourcesInteractorOutput {
        
        var didPresentError = false
        
        var presentedList: [BaseModel] = []
        
        func presentList(with resources: [BaseModel]) {
            presentedList = resources
        }
        
        func presentError() {
            didPresentError = true
        }
        
    }
    
}
