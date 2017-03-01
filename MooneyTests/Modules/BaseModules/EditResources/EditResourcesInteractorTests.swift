//
//  EditResourcesInteractorTests.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 28/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import XCTest
import DATAStack

@testable import Mooney

class EditResourcesInteractorTests: XCTestCase {
    
//    var interactor: EditResourcesInteractor<AccountModel>!
//    var presenter: EditResourcesInteractorOutputDouble!
//    
//    override func setUp() {
//        interactor = EditResourcesInteractor<AccountModel>(with: DATAStack(modelName: "MooneyDataModel", storeType: .inMemory), andEntityName:"Account")
//        presenter = EditResourcesInteractorOutputDouble()
//        interactor.output = presenter
//    }
//    
//    func testEditResourcesInteractorDidPresentNewAccountForEdition() {
//        interactor.prepareNewItemForEdition()
//        let presentedAccount = presenter.presentedItem as? AccountModel
//        XCTAssertNotNil(presentedAccount)
//    }
//    
//    func testEditResourcesInteractorDidPresentExistingAccountForEdition() {
//        DatabaseUtils.createAccount(with: "Banco", in: interactor.dataStack.mainContext, and: NSDate())
//        let account = DatabaseUtils.fetchAccounts(in: interactor.dataStack.mainContext)[0]
//        interactor.prepareItemForEdition(item: account)
//        let presentedAccount = presenter.presentedItem as? AccountModel
//        XCTAssertNotNil(presentedAccount)
//    }
//    
//    func testEditResourcesInteractorDidNotSaveAccountWithEmptyName() {
//        interactor.prepareNewItemForEdition()
//        let presentedAccount = presenter.presentedItem as! AccountModel
//        interactor.saveItem(item: presentedAccount)
//        
//        XCTAssertTrue(presenter.didPresentErrorForSavingItem)
//        
//        let accounts = DatabaseUtils.fetchAccounts(in: interactor.dataStack.mainContext)
//        
//        XCTAssertEqual(accounts.count, 0)
//    }
//    
//    func testEditResourcesInteractorDidSaveAccount() {
//        interactor.prepareNewItemForEdition()
//        let presentedAccount = presenter.presentedItem as! AccountModel
//        presentedAccount.name = "Banco"
//        interactor.saveItem(item: presentedAccount)
//        
//        XCTAssertTrue(presenter.didPresentSuccessForSavingItem)
//        
//        let accounts = DatabaseUtils.fetchAccounts(in: interactor.dataStack.mainContext)
//        XCTAssertEqual(accounts.count, 1)
//    }
    
    
    //MARK: Doubles
    
    class EditResourcesInteractorOutputDouble: EditResourcesInteractorOutput {
        
        var presentedItem: BaseModel?
        
        var didPresentSuccessForSavingItem = false
        var didPresentErrorForSavingItem = false
        
        func presentForEdition(item: BaseModel) {
            self.presentedItem = item
        }
        
        func presentSuccessForSavingItem() {
            didPresentSuccessForSavingItem = true
        }
        
        func presentErrorForSavingItem() {
            didPresentErrorForSavingItem = true
        }
        
    }
    
}
