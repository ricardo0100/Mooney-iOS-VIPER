//
//  AccountsAccountsInteractorOutput.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import Foundation

protocol AccountsInteractorOutput: class {
    
    func presentListWith(_ accounts: [Account])

    func presentBlankstate()
    
    func presentError(with title: String, and message: String)
    
}
