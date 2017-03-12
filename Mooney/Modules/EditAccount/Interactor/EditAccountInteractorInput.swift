//
//  EditAccountInteractorInput.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 28/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

protocol EditAccountInteractorInput {
    
    associatedtype Struct: BaseStruct
    
    func saveItemWith(itemStruct: Struct)
    
    func prepareNewItemForEdition()
    
    func prepareForEditionItem(with id: String?)
    
}
