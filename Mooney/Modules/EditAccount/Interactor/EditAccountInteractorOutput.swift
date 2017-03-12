//
//  EditAccountInteractorOutput.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 28/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

protocol EditAccountInteractorOutput {
    
    func successCallback()
    
    func presentError(with message: String)
    
    func presentItemForEdition(itemStruct: BaseStruct)
    
}
