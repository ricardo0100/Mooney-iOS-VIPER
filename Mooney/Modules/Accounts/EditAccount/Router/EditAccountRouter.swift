//
//  EditAccountEditAccountRouter.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 15/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import UIKit

class EditAccountRouter: EditAccountRouterInput {
    
    let rootViewController: UIViewController
    
    init(withRoot viewController: UIViewController) {
        self.rootViewController = viewController
    }
    
    func dismissViewController() {
        self.rootViewController.dismiss(animated: true, completion: nil)
    }

}
