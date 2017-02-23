//
//  AccountsAccountsViewOutput.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

protocol ListResourcesViewOutput {
    
    func refreshResourcesList()
    
    func numberOfItems() -> Int
    
    func resourceForItem(at index: Int) -> BaseEntity
    
    func didTapNewButton()
    
    func didSelectItem(at index: Int)
    
    func didTapDeleteActionFotItem(at index: Int)
    
    func didTapEditActionFotItem(at index: Int)
    
}
