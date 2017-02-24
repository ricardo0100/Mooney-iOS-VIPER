//
//  ListResourcesPresenter.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 21/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import CoreData

class ListResourcesPresenter<Entity: BaseEntity, Model: BaseModel>: ListResourcesViewOutput,  ListResourcesInteractorOutput {
    
    var view: ListResourcesViewInput!
    var interactor: ListResourcesInteractor<Model>!
    
    private var items: [BaseModel] = []
    
    
    //MARK: ListResourcesViewOutput
    
    func refreshResourcesList() {
        interactor.fetchList()
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func resourceForItem(at index: Int) -> BaseEntity {
        return Entity(object: items[index])
    }
    
    func didTapNewButton() {
        
    }
    
    func didSelectItem(at index: Int) {
        
    }
    
    func didTapDeleteActionFotItem(at index: Int) {
        if interactor.deleteResource(items[index]) {
            items.remove(at: index)
            view.removeCellFromList(at: index)
        } else {
            view.showAlert(with: "Oops", and: "Error deleting item!")
        }
    }
    
    func didTapEditActionFotItem(at index: Int) {
        
    }
    
    
    //MARK: ListResourcesInteractorOutput
    
    func presentList(with items: [BaseModel]) {
        self.items = items
        if items.isEmpty {
            view.showBlankstate()
        } else {
            view.showList()
        }
    }
    
    func presentError() {
        
    }
    
}
