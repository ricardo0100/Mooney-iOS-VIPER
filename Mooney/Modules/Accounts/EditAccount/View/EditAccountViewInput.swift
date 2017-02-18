//
//  EditAccountEditAccountViewInput.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 15/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

protocol EditAccountViewInput: class {

    /**
        @author Ricardo Gehrke Filho
        Setup initial state of the view
    */

    func setupInitialState()
    
    func presentValidationError(for field: String, and message: String)
    
    func presentError(with title: String, and message: String)
    
}
