//
//  ListResourcesViewInput.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

protocol ListResourcesViewInput: class {
    
    func showList()
    
    func showBlankstate()
    
    func hideBlankstate()
    
    func showAlert(with title: String, and message: String)
    
    func removeCellFromList(at index: Int)
    
}
