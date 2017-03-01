//
//  AccountsListRouter.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 03/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class ListAccountsRouter: ListResourcesRouterInput {
    
    var editAccountRouter: EditAccountRouter
    var rootViewController: ListAccountsViewController
    
    init(rootViewController: ListAccountsViewController) {
        self.rootViewController = rootViewController
        editAccountRouter = EditAccountRouter()
    }
    
    func presentEditView(for resource: BaseModel?) {
        editAccountRouter.presentEditView(for: resource, in: rootViewController)
    }
    
}
