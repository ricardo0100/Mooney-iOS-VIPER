//
//  AccountsAccountsInteractorInput.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import Foundation

protocol AccountsInteractorInput {
    
    func fetchAccountsList()
    
    func deleteAccount(_ account: Account, at index: Int)
    
}
