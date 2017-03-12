//
//  EditItemRouterInput.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 03/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

protocol EditItemRouterInput {
    
    func presentNewItemInterface(in viewController: UIViewController)
    
    func dismissInterface()
    
}
