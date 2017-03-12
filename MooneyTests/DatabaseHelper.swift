//
//  DatabaseHelper.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 13/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import RealmSwift

@testable import Mooney

class DatabaseHelper {
    
    var realm: Realm
    
    init(with realm: Realm) {
        self.realm = realm
    }
    
    func addAccountWith(name: String) -> String {
        let account = Account()
        account.name = name
        try! realm.write {
            realm.add(account)
        }
        return account.id
    }
    
    func getAllAccounts() -> [Account] {
        return realm.objects(Account.self).map({ (account) -> Account in
            return account
        })
    }
    
}
