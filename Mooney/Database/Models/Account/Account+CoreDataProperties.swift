//
//  Account+CoreDataProperties.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 14/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account");
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var createdAt: NSDate?
    @NSManaged public var updatedAt: NSDate?

}
