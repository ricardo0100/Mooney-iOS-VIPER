//
//  EditResourcesInteractor.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 28/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation
import DATAStack

class EditResourcesInteractor<Model: BaseModel>: EditResourcesInteractorInput {
    
    weak var output: EditResourcesInteractorOutput!
    
    var dataStack: DATAStack
    var entityName: String
    
    init(with dataStack: DATAStack, andEntityName name: String) {
        self.dataStack = dataStack
        self.entityName = name
    }
    
    
    
}
