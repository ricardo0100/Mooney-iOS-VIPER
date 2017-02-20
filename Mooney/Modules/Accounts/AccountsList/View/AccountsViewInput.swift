//
//  AccountsAccountsViewInput.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

protocol AccountsViewInput: class {

    /**
        @author Ricardo Gehrke Filho
        Setup initial state of the view
    */

    func setupInitialState()
    
    func showList(with accounts: [Account])
    
    func showBlankstate()
    
    func showAlert(with title: String, and message: String)
    
    func removeFromViewListAccount(at index: Int)
    
}
