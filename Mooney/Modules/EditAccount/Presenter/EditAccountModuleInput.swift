//
//  EditItemPresenterInput.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 28/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

protocol EditAccountModuleInput {
    
    func prepareEditionForNewItem()
    
    func prepareEditionForItem(with id: String)
    
}
