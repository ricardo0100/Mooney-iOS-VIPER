//
//  EditAccountRouter.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 03/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit
import RealmSwift

class EditAccountRouter: EditItemRouterInput {
    
    var editAccountNavigationController: UINavigationController!
    var editAccountViewController: EditAccountViewController!
    
    init() {
        let storyboard = UIStoryboard(name: "EditAccount", bundle: nil)
        editAccountNavigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        editAccountViewController = editAccountNavigationController.viewControllers[0] as! EditAccountViewController
        configureModule()
    }
    
    func configureModule() {
        let presenter = EditItemPresenter()
        presenter.router = self
        let realm = try! Realm()
        let interactor = EditItemInteractor<Account>(with: realm)
        presenter.interactor = interactor
        editAccountViewController.output = presenter
    }
    
    func presentNewItemInterface(in viewController: UIViewController) {
        viewController.present(editAccountNavigationController, animated: true, completion: nil)
    }
    
    func dismissInterface() {
        editAccountNavigationController.dismiss(animated: true, completion: nil)
    }
    
}
