//
//  ListAccountsViewOutput.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

protocol ListAccountsViewOutput {
    
    func didTapNewItemButton()
    
    func fetchItems()
    
    func numberOfItems() -> Int
    
    func itemName(at index: Int) -> String
    
    func deleteItem(at index: Int)
    
    func presentEditInterfaceForItem(at index: Int)
    
    func filterItems(with searchText: String)
    
}
