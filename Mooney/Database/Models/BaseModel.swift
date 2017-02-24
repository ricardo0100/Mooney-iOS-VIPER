//
//  BaseEntity+CoreDataClass.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 22/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation
import CoreData

class BaseModel: NSManagedObject {

    @NSManaged public var id: Int64
    @NSManaged public var createdAt: NSDate?
    @NSManaged public var updatedAt: NSDate?
    
}
