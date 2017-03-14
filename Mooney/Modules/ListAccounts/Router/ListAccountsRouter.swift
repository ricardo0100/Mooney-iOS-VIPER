//
//  ListAccountsRouter.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 03/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit
import RealmSwift

class ListAccountsRouter: NSObject, ListAccountsRouterInput {

    @IBOutlet var listAccountsViewController: ListAccountsViewController!

    var editAccountRouter: EditAccountRouter!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        editAccountRouter = EditAccountRouter()
        configureModule()
    }
    
    func configureModule() {
        let presenter = ListAccountsPresenter()
        let realm = try! Realm()
        let interactor = ListAccountsInteractor(with: realm)
        presenter.view = listAccountsViewController
        presenter.router = self
        presenter.interactor = interactor
        interactor.output = presenter
        listAccountsViewController.output = presenter
    }
    
    func presentNewItemInterface() {
        editAccountRouter.presentNewItemInterface(in: listAccountsViewController)
    }
    
    func presentEditItemInterfaceForItem(with id: String) {
        editAccountRouter.presentEditItemInterfaceForItem(with: id, in: listAccountsViewController)
    }
    
}

