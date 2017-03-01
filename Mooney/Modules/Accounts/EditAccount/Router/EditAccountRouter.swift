//
//  EditAccountRouter.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 03/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class EditAccountRouter: EditResourcesRouterInput {
    
    var navigationController: UINavigationController
    
    init() {
        let storyboard = UIStoryboard(name: "EditAccount", bundle: nil)
        self.navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let editAccountViewController = navigationController.viewControllers[0] as! EditAccountViewController
        
        let presenter = EditResourcesPresenter<Account, AccountModel>()
        editAccountViewController.output = presenter
    }
    
    func presentEditView(for item: BaseModel?, in viewController: UIViewController) {
        viewController.present(navigationController, animated: true, completion: nil)
    }
    
}
