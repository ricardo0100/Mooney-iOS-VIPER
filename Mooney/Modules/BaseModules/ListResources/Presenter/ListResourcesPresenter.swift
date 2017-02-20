//
//  AccountsAccountsPresenter.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

class ListResourcesPresenter<Resource: BaseEntity>: ListResourcesPresenterInput, ListResourcesViewOutput, ListResourcesInteractorOutput {
    
    weak var view: AccountsViewInput!
    var interactor: AccountsInteractorInput!
    var router: AccountsRouterInput!
    
    
    //MARK: ListResourcesPresenterInput
    
    func reloadList() {
        
    }
    
    
    //MARK: ListResourcesViewOutput
    
    func presentNewResourceView() {
        
    }
    
    func refreshResourcesList() {
        
    }
    
    func presentEditResourceView(for resource: BaseEntity) {
        
    }
    
    func deleteResource(_ resource: BaseEntity, at index: Int) {
        
    }
    
    
    //MARK: ListResourcesInteractorOutput
    
    func presentListWith(_ resources: [BaseEntity]) {
        
    }
    
    func presentBlankstate() {
        
    }
    
    func presentError(with title: String, and message: String) {
        
    }
    
    func presentSuccessForResourceDeletionAt(_ index: Int) {
        
    }
    
}
