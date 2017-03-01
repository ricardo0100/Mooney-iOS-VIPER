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
    
    static func createAccount(with name: String, in context: NSManagedObjectContext, and date: NSDate) {
        let account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context) as! AccountModel
        account.name = name
        account.createdAt = date
        account.updatedAt = date
        try! context.save()
    }
    
    static func fetchAccounts(in context: NSManagedObjectContext) -> [AccountModel] {
        let fetch = NSFetchRequest<AccountModel>(entityName: "Account")
        return try! context.fetch(fetch)
    }
    
}
