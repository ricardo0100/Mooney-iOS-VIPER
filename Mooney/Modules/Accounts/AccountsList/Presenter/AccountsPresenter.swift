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
    
    var accountsToPresent: [Account] = []
    
    
    // MARK: AccountModuleInput
    func reloadAccountsList() {
        interactor.fetchAccountsList()
    }
    
    
    // MARK: AccountsViewOutput
    func viewIsReady() {
        interactor.fetchAccountsList()
    }
    
    func presentNewAccountView() {
        router.presentEditView(for: nil)
    }
    
    func refreshAccountsList() {
        interactor.fetchAccountsList()
    }
    
    func presentEditViewForAccount(at index: Int) {
        let account = accountsToPresent[index]
        router.presentEditView(for: account)
    }
    
    func deleteAccount(_ account: Account, at index: Int) {
        interactor.deleteAccount(account, at: index)
    }
    
    
    // MARK: AccountsInteractorOutput
    func presentListWith(_ accounts: [Account]) {
        accountsToPresent = accounts
        view.showList(with: accounts)
    }
    
    func presentBlankstate() {
        view.showBlankstate()
    }
    
    func presentError(with title: String, and message: String) {
        view.showAlert(with: title, and: message)
    }
    
    func presentSuccessForAccountDeletionAt(_ index: Int) {
        view.removeFromViewListAccount(at: index)
    }
    
}
