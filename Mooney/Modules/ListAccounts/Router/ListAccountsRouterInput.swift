//
//  ListAccountsRouterInput.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 20/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

protocol ListAccountsRouterInput {
    
    func presentNewItemInterface()
    
    func presentEditItemInterfaceForItem(with id: String)
    
}
