//
//  Account.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 23/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

struct Account: BaseEntity {
    
    var name: String
    
    init(object: BaseModel) {
        let account = object as! AccountModel
        self.name = account.name!
    }
    
}
