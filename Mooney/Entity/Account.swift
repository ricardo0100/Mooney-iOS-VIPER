//
//  Account.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 11/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation
import RealmSwift

class Account: Object, UpdatableFromStruct {
    
    let remoteID = RealmOptional<Int>()
    
    dynamic var id = NSUUID().uuidString
    
    dynamic var createdAt = NSDate()
    dynamic var updatedAt = NSDate()
    
    dynamic var name = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func updateFromStruct(itemStruct: BaseStruct) {
        let accountStruct = itemStruct as! AccountStruct
        self.name = accountStruct.name
    }
    
}

