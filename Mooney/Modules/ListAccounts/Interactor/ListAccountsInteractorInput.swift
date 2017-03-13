//
//  ListAccountsInteractorInput.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import Foundation

protocol ListAccountsInteractorInput {
    
    func fetchItems()
    
    func numberOfItems() -> Int
    
    func itemID(at index: Int) -> String
    
    func itemName(at index: Int) -> String
    
    func deleteItem(at index: Int)
    
}
