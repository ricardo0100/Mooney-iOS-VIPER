//
//  EditResourcesPresenterTests.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 28/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation
import XCTest

@testable import Mooney

class EditResourcesPresenterTests: XCTestCase {
    
    var presenter: EditResourcesPresenter<Account, AccountModel>!
    
    override func setUp() {
        presenter = EditResourcesPresenter<Account, AccountModel>()
    }
    
    func testDidPresentNewAccountForEditionInView() {
        
    }
    
    
    //MARK: Doubles
    
    class EditResourcesViewInputDouble: EditResourcesViewInput {
        
    }
    
}
