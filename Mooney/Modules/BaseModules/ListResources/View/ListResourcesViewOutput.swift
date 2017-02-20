//
//  AccountsAccountsViewOutput.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

protocol ListResourcesViewOutput {
    
    func presentNewResourceView()
    
    func refreshResourcesList()
    
    func presentEditResourceView(for resource: BaseEntity)
    
    func deleteResource(_ resource: BaseEntity, at index: Int)
    
}
