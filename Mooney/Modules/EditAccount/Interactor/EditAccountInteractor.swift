//
//  EditAccountInteractor.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 12/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import RealmSwift

class EditAccountInteractor: EditAccountInteractorInput {
    
    var output: EditAccountInteractorOutput!
    
    var realm: Realm
    
    var account: Account?
    
    init(with realm: Realm) {
        self.realm = realm
    }
    
    func prepareNewItemForEdition() {
        account = nil
    }
    
    func prepareForEditionItem(with id: String) {
        account = realm.objects(Account.self).filter("id = '\(id)'").first
    }
    
    func presentItem() {
        if let account = account {
            output.presentItemForEditionWith(title: account.name, name: account.name)
        } else {
            output.presentItemForEditionWith(title: "New account", name: "")
        }
    }
    
    func saveAccountWithName(name: String) {
        if name.isEmpty {
            output.presentError(for: "name", with: "Name should not be empty")
        } else {
            do {
                try realm.write {
                    if self.account == nil {
                        self.account = Account()
                    }
                    if let account = self.account {
                        account.name = name
                        realm.add(account)
                    }
                }
                output.successCallback()
            } catch {
                output.presentError(with: "Error", and: "Error saving item")
            }
        }
    }
    
}

