//
//  EditAccountInteractorOutputDouble.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 17/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

@testable import Mooney


class EditAccountInteractorOutputDouble: EditAccountInteractorOutput {
    
    var didPresentSuccess = false
    var didPresentValidationError = false
    var didPresentError = false
    
    func presentSuccess() {
        didPresentSuccess = true
    }
    
    func presentValidationError(for field: String, and message: String) {
        didPresentValidationError = true
    }
    
    func presentError(with title: String, and message: String) {
        didPresentError = true
    }
    
}
