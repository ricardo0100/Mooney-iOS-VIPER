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
    
    static func createAccount(with name: String, in context: NSManagedObjectContext) {
        let account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context) as! Account
        account.name = name
        try! context.save()
    }
    
}
