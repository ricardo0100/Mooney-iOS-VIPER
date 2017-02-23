//
//  Account+CoreDataClass.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 22/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation
import CoreData

class AccountModel: BaseModel {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<AccountModel> {
        return NSFetchRequest<AccountModel>(entityName: "Account");
    }
    
    @NSManaged public var name: String?
    
    override func convertToEntity<T : BaseEntity>() -> T {
        let account = Account(name: self.name!)
        return account as! T
    }
        
}
