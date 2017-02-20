//
//  AccountsAccountsViewOutput.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

protocol AccountsViewOutput {

    func viewIsReady()
    
    func presentNewAccountView()
    
    func refreshAccountsList()
    
    func presentEditView(for account: Account)
        
    func deleteAccount(_ account: Account, at index: Int)
    
}
