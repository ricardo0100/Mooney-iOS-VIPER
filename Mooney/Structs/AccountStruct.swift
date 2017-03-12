//
//  AccountStruct.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 12/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

struct AccountStruct: BaseStruct {
    
    let id: String?
    let name: String
    
    init (id: String?, name: String) {
        self.id = id
        self.name = name
    }
    
}

