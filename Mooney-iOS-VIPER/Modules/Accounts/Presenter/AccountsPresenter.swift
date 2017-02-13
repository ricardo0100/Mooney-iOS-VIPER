//
//  AccountsAccountsPresenter.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

class AccountsPresenter: AccountsModuleInput, AccountsViewOutput, AccountsInteractorOutput {

    weak var view: AccountsViewInput!
    var interactor: AccountsInteractorInput!
    var router: AccountsRouterInput!

    func viewIsReady() {
        interactor.showAccountsList()
    }
    
    func show(_ accounts: [String]) {
        view.show(accounts)
    }
    
}
