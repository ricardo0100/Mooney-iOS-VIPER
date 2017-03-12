//
//  ListAccountsRouter.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 03/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit
import CoreData

class ListAccountsRouter: NSObject, ListItemsRouterInput {

    @IBOutlet var listAccountsViewController: ListAccountsViewController!

    var editAccountRouter: EditAccountRouter!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        editAccountRouter = EditAccountRouter()
        configureModule()
    }
    
    func configureModule() {
        let presenter = ListItemsPresenter()
        presenter.router = self
        listAccountsViewController.output = presenter
    }
    
    func presentNewItemInterface() {
        editAccountRouter.presentNewItemInterface(in: listAccountsViewController)
    }
    
}

