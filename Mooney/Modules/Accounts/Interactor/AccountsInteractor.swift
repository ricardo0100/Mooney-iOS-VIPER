//
//  AccountsAccountsInteractor.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import DATAStack

class AccountsInteractor: AccountsInteractorInput, DatabaseAccessable {

    weak var output: AccountsInteractorOutput!
    
    var dataStack: DATAStack
    
    required init(dataStack: DATAStack) {
        self.dataStack = dataStack
    }
    
    func fetchAccountsList() {
        output.presentBlankstate()
    }
    
}
