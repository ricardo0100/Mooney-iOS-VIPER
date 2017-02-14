//
//  AccountsAccountsInteractor.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

class AccountsInteractor: AccountsInteractorInput {

    weak var output: AccountsInteractorOutput!

    func showAccountsList() {
        output.presentBlankstate()
    }
    
}
