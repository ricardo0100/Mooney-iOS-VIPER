//
//  AccountsPresenterDouble.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 14/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

@testable import Mooney

class AccountsInteractorOutputDouble: AccountsInteractorOutput {
    
    var didPresentAccountsList = false
    var didPresentBlankstate = false
    var didPresentError = false
    var didPresentSuccessForAccountDeletionAt = false
    
    var presentedAccounts: [Account] = []
    
    func presentListWith(_ accounts: [Account]) {
        presentedAccounts = accounts
        didPresentAccountsList = true
    }
    
    func presentBlankstate() {
        didPresentBlankstate = true
    }
    
    func presentError(with title: String, and message: String) {
        didPresentError = true
    }
    
    func presentSuccessForAccountDeletionAt(_ index: Int) {
        didPresentSuccessForAccountDeletionAt = true
    }
    
}
