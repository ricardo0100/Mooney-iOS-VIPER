//
//  EditAccountViewInput.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 28/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

protocol EditAccountViewInput {
    
    func fillFieldsWith(name: String)
    
    func presentError(with title: String, and message: String)
    
}
