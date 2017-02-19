//
//  EditAccountEditAccountInteractorInput.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 15/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import Foundation
import CoreData

protocol EditAccountInteractorInput {
    
    func save(account object: Account?, with name: String)

}
