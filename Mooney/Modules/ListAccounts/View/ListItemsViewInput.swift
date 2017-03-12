//
//  ListAccountsViewInput.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

protocol ListAccountsViewInput {
    
    func showList()
    
    func showBlankstate()
    
    func hideBlankstate()
    
    func removeCellFromList(at index: Int)
    
}
