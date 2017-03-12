//
//  EditAccountRouter.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 03/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit
import RealmSwift

class EditAccountRouter: EditAccountRouterInput {
    
    var editAccountNavigationController: UINavigationController!
    var editAccountViewController: EditAccountViewController!
    var moduleInput: EditAccountModuleInput!
    
    init() {
        let storyboard = UIStoryboard(name: "EditAccount", bundle: nil)
        editAccountNavigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        editAccountViewController = editAccountNavigationController.viewControllers[0] as! EditAccountViewController
        configureModule()
    }
    
    func configureModule() {
        let presenter = EditAccountPresenter()
        moduleInput = presenter
        presenter.router = self
        presenter.view = editAccountViewController
        let realm = try! Realm()
        let interactor = EditAccountInteractor(with: realm)
        interactor.output = presenter
        presenter.interactor = interactor
        editAccountViewController.output = presenter
    }
    
    func presentNewItemInterface(in viewController: UIViewController) {
        moduleInput.prepareEditionForNewItem()
        viewController.present(editAccountNavigationController, animated: true, completion: nil)
    }
    
    func presentEditItemInterfaceForItem(with id: String, in viewController: UIViewController) {
        moduleInput.prepareEditionForItem(with: id)
        viewController.present(editAccountNavigationController, animated: true, completion: nil)
    }
    
    func dismissInterface() {
        editAccountNavigationController.dismiss(animated: true, completion: nil)
    }
    
}

