//
//  EditAccountEditAccountInteractorOutput.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 15/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import Foundation

protocol EditAccountInteractorOutput: class {
    
    func presentSuccess()
    
    func presentValidationError(for field: String, and message: String)
    
    func presentError(with title: String, and message: String)

}
