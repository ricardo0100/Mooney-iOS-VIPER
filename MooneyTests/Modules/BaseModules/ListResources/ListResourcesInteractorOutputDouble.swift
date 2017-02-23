//
//  ListResourcesInteractorOutputDouble.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 21/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import CoreData

@testable import Mooney

class ListResourcesInteractorOutputDouble: ListResourcesInteractorOutput {
    
    var didPresentError = false
    
    var presentedList: [BaseModel] = []
    
    func presentList(with resources: [BaseModel]) {
        presentedList = resources
    }
    
    func presentError() {
        didPresentError = true
    }
        
}
