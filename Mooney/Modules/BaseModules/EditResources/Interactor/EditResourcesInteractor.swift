//
//  EditResourcesInteractor.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 28/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation
import RealmSwift

class EditResourcesInteractor<Entity: Object, Struct: Any>: EditResourcesInteractorInput {
    
    weak var output: EditResourcesInteractorOutput!
    
    var realm: Realm
    
    init(with realm: Realm) {
        self.realm = realm
    }
    
}
