//
//  CoreDataStack.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 13/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation
import DATAStack

protocol DatabaseAccessable {
    
    var dataStack: DATAStack { get set }
    
    init(dataStack: DATAStack)
    
}
