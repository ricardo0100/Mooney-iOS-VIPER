//
//  AccountsAccountsInitializer.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import UIKit
import DATAStack

//TODO: Move to router
class AccountsModuleInitializer: NSObject {

    @IBOutlet weak var accountsViewController: ListAccountsViewController!
    
    override func awakeFromNib() {
        configure()
    }
    
    private func configure() {
        
        let presenter = ListResourcesPresenter<Account, AccountModel>()
        presenter.view = accountsViewController
        
        let router = ListAccountsRouter(rootViewController: accountsViewController)
        presenter.router = router
        
        let interactor = ListResourcesInteractor<AccountModel>(with: DATAStack(modelName: "MooneyDataModel"), andEntityName: "Account")
        interactor.output = presenter
        
        presenter.interactor = interactor
        accountsViewController.output = presenter
    }

}
