//
//  Resource.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 20/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

protocol BaseEntity {
    
    static func fetchAll() throws -> [BaseEntity]
    
    func delete() throws
    
}
