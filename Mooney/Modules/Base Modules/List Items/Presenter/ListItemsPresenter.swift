//
//  ListItemsPresenter.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 21/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import CoreData

class ListItemsPresenter: ListItemsModuleInput, ListItemsViewOutput,  ListItemsInteractorOutput {

    var router: ListItemsRouterInput!
    
    func didTapNewItemButton() {
        router.presentNewItemInterface()
    }

}
