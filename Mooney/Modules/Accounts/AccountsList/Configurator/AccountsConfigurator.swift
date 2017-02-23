//
//  AccountsAccountsConfigurator.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import UIKit
import DATAStack

class AccountsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? AccountsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AccountsViewController) {

        let presenter = ListResourcesPresenter<Account, AccountModel>()
        presenter.view = viewController
        
        let interactor = ListResourcesInteractor<AccountModel>(with: DATAStack(modelName: "MooneyDataModel"), andEntityName: "Account")
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
