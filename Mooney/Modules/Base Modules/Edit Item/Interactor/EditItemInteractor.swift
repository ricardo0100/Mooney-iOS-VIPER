//
//  EditItemInteractor.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 28/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation
import RealmSwift

class EditItemInteractor<Entity: Object>: EditItemInteractorInput {
    
    weak var output: EditItemInteractorOutput!
    
    var realm: Realm
    
    init(with realm: Realm) {
        self.realm = realm
    }
    
    func saveItemWith(name: String) {
        print(name)
    }
    
}
