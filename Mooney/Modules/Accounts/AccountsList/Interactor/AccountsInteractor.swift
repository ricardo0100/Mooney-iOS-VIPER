//
//  AccountsAccountsInteractor.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import DATAStack

class AccountsInteractor: AccountsInteractorInput {

    weak var output: AccountsInteractorOutput!
    
    var dataStack: DATAStack
    
    required init(dataStack: DATAStack) {
        self.dataStack = dataStack
    }
    
    func fetchAccountsList() {
        do {
            let accounts = try dataStack.mainContext.fetch(Account.fetchRequest()) as [Account]
            if accounts.count == 0 {
                output.presentBlankstate()
            } else {
                output.presentListWith(accounts)
            }
        } catch {
            output.presentError(with: "Oops!", and: "Error fetching accounts!")
        }
    }
    
}
