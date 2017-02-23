//
//  ListResourcesPresenter.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 21/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import CoreData

class ListResourcesPresenter<Entity: BaseEntity, Model: BaseModel>: ListResourcesViewOutput, ListResourcesInteractorInput, ListResourcesInteractorOutput {
    
    var view: ListResourcesViewInput!
    var interactor: ListResourcesInteractor<Model>!
    
    private var items: [Entity] = []
    
    
    //MARK: ListResourcesViewOutput
    
    func refreshResourcesList() {
        interactor.fetchList()
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func resourceForItem(at index: Int) -> BaseEntity {
        return items[index]
    }
    
    func didTapNewButton() {
        
    }
    
    func didSelectItem(at index: Int) {
        
    }
    
    func didTapDeleteActionFotItem(at index: Int) {
        
    }
    
    func didTapEditActionFotItem(at index: Int) {
        
    }
    
    
    //MARK: ListResourcesInteractorInput
    
    func fetchList() {
        
    }
    
    func deleteResource(_ resource: NSManagedObject) {
        
    }
    
    
    //MARK: ListResourcesInteractorOutput
    
    func presentList(with items: [BaseModel]) {
        if items.isEmpty {
            view.showBlankstate()
        } else {
            self.items = items.map({ (modelObject) -> Entity in
                return modelObject.convertToEntity()
            })
            view.showList()
        }
    }
    
    func presentError() {
        
    }
    
}
