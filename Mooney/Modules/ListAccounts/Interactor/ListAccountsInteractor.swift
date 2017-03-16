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
    var filteredAccounts: [Account] = []
    
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
        filteredAccounts = self.accounts
        output.didFetchItems()
    }
    
    func numberOfItems() -> Int {
        return filteredAccounts.count
    }
    
    func itemName(at index: Int) -> String {
        let object = filteredAccounts[index]
        return object.name
    }
    
    func itemID(at index: Int) -> String {
        let object = filteredAccounts[index]
        return object.id
    }
    
    func deleteItem(at index: Int) {
        try! realm.write {
            let accountToDelete = filteredAccounts[index]
            realm.delete(accountToDelete)
            filteredAccounts.remove(at: index)
            accounts.remove(at: accounts.index(of: accountToDelete)!)
        }
    }
    
    func filterItems(with searchText: String) {
        if searchText.isEmpty {
            self.filteredAccounts = self.accounts
        } else {
            self.filteredAccounts = self.accounts.filter({ (account) -> Bool in
                return account.name.lowercased().contains(searchText.lowercased())
            })
        }
        output.didFetchItems()
    }
    
}
