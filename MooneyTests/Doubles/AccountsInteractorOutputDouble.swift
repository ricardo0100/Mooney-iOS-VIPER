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
    
    var accountsList: [Account] = []
    
    func presentListWith(_ accounts: [Account]) {
        accountsList = accounts
        didPresentAccountsList = true
    }
    
    func presentBlankstate() {
        didPresentBlankstate = true
    }
    
}
