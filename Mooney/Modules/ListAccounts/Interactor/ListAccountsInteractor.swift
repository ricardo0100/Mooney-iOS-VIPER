//
//  ListAccountsInteractor.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 12/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation
import RealmSwift

class ListAccountsInteractor: ListAccountsInteractorInput {
    
    var output: ListAccountsInteractorOutput!
    
    var accounts: [Account] = []
    
    var realm: Realm
    init(with realm: Realm) {
        self.realm = realm
    }
    
    func fetchItems() {
        let accounts = realm.objects(Account.self)
        self.accounts.removeAll()
        for account in accounts {
            self.accounts.append(account)
        }
        output.didFetchItems()
    }
    
    func numberOfItems() -> Int {
        return accounts.count
    }
    
    func item(at index: Int) -> BaseStruct {
        let object = accounts[index]
        return AccountStruct(id: object.id, name: object.name)
    }
    
    func deleteItem(at index: Int) {
        try! realm.write {
            realm.delete(accounts[index])
            accounts.remove(at: index)
        }
    }
    
}