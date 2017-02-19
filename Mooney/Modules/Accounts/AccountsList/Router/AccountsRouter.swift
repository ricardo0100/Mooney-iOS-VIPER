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
    let editAccountViewController: EditAccountViewController
    
    let storyBoard = UIStoryboard(name: "EditAccount", bundle: nil)
    
    init(withRoot viewController: UIViewController) {
        editAccountViewController = storyBoard.instantiateInitialViewController() as! EditAccountViewController
        rootViewController = viewController
    }
        
    func presentEditView(for account: Account?) {
        editAccountViewController.account = account
        rootViewController.present(editAccountViewController, animated: true, completion: nil)
    }

}
