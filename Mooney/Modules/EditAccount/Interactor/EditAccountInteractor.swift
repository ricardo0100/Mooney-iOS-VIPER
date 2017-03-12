//
//  EditAccountInteractor.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 12/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import RealmSwift

class EditAccountInteractor: EditAccountInteractorInput {
    
    typealias Struct = AccountStruct
    
    var output: EditAccountInteractorOutput!
    
    var realm: Realm
    
    init(with realm: Realm) {
        self.realm = realm
    }
    
    func saveItemWith(itemStruct: Struct) {
        do {
            let account = Account()
            account.updateFromStruct(itemStruct: itemStruct)
            try realm.write {
                realm.add(account)
            }
            output.successCallback()
        } catch {
            
        }
    }
    
    func prepareNewItemForEdition() {
        output.presentItemForEdition(itemStruct: AccountStruct(id: nil, name: ""))
    }
    
    func prepareForEditionItem(with id: String?) {
        if let id = id {
            let account = realm.objects(Account.self).filter("id = '\(id)'").first!
            output.presentItemForEdition(itemStruct: AccountStruct(id: account.id, name: account.name))
        }
    }
    
}

