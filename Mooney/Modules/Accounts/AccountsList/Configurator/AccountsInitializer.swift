//
//  AccountsAccountsInitializer.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import UIKit

class AccountsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var accountsViewController: AccountsViewController!
    
    override func awakeFromNib() {
        let configurator = AccountsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: accountsViewController)
    }

}
