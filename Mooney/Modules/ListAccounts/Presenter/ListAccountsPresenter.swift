//
//  ListAccountsPresenter.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 12/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

class ListAccountsPresenter: ListAccountsViewOutput, ListAccountsInteractorOutput, ListAccountsModuleInput {

    var router: ListAccountsRouterInput!
    var view: ListAccountsViewInput!
    var interactor: ListAccountsInteractorInput!
    
    func didTapNewItemButton() {
        router.presentNewItemInterface()
    }
    
    func fetchItems() {
        interactor.fetchItems()
    }
    
    func numberOfItems() -> Int {
        return interactor.numberOfItems()
    }
    
    func itemName(at index: Int) -> String {
        return interactor.itemName(at: index)
    }
    
    func deleteItem(at index: Int) {
        interactor.deleteItem(at: index)
        view.removeCellFromList(at: index)
        validateBlankstate()
    }
    
    func presentEditInterfaceForItem(at index: Int) {
        router.presentEditItemInterfaceForItem(with: interactor.itemID(at: index))
    }
    
    
    //MARK: ListItemsInteractorOutput
    
    func didFetchItems() {
        view.showList()
        validateBlankstate()
    }
    
    
    //MARK: Private methods
    
    func validateBlankstate() {
        if interactor.numberOfItems() == 0 {
            view.showBlankstate()
        } else {
            view.hideBlankstate()
        }
    }
    
}

