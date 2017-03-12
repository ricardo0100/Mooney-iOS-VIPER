//
//  EditAccountViewOutput.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 28/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

protocol EditAccountViewOutput {
    
    func didTapCancelButton()
    
    func didTapSaveButton(name: String)
    
    func viewIsReady()
        
}
