//
//  EditAccountInteractorInput.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 28/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

protocol EditAccountInteractorInput {
    
    func prepareNewItemForEdition()
    
    func prepareForEditionItem(with id: String)
    
    func presentItem()
    
    func saveAccountWithName(name: String)
    
}
