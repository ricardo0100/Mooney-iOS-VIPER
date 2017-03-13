//
//  EditAccountRouterInput.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 03/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

protocol EditAccountRouterInput {
    
    func presentNewItemInterface(in viewController: UIViewController)
    
    func presentEditItemInterfaceForItem(with id: String, in viewController: UIViewController)
    
    func dismissInterface()
    
}
