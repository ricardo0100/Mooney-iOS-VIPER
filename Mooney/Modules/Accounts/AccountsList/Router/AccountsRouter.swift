//
//  AccountsAccountsRouter.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import UIKit

class AccountsRouter: AccountsRouterInput {
    
    let rootViewController: UIViewController
    
    init(withRoot viewController: UIViewController) {
        self.rootViewController = viewController
    }
    
    func presentNewAccountView() {
        let storyBoard = UIStoryboard(name: "EditAccount", bundle: nil)
        let viewController = storyBoard.instantiateInitialViewController()
        self.rootViewController.present(viewController!, animated: true, completion: nil)
    }

}
