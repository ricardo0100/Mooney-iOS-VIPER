//
//  DatabaseUtils.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 15/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation
import CoreData

@testable import Mooney

class DatabaseUtils {
    
    static func createAccount(with name: String, in context: NSManagedObjectContext) -> Account {
        let account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context) as! Account
        account.name = name
        account.createdAt = NSDate()
        account.updatedAt = NSDate()
        try! context.save()
        return account
    }
    
    static func fetchAccounts(in context: NSManagedObjectContext) -> [Account] {
        return try! context.fetch(Account.fetchRequest()) as [Account]
    }
    
}
