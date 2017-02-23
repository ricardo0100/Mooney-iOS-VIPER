//
//  AccountsAccountsInteractorOutput.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import CoreData

protocol ListResourcesInteractorOutput: class {
    
    func presentList(with items: [BaseModel])
    
    func presentError()
    
}
