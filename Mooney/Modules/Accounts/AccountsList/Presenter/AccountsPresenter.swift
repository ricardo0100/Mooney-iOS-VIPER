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
        interactor.fetchAccountsList()
    }
    
    func presentListWith(_ accounts: [Account]) {
        view.show(accounts)
    }
    
    func presentBlankstate() {
        view.showBlankstate()
    }
    
    func presentError(with title: String, and message: String) {
        view.showAlert(with: title, and: message)
    }
    
    func presentNewAccountView() {
        router.presentEditView(for: nil)
    }
    
    func refreshAccountsList() {
        interactor.fetchAccountsList()
    }
    
    func presentEditView(for account: Account) {
        router.presentEditView(for: account)
    }
    
}
