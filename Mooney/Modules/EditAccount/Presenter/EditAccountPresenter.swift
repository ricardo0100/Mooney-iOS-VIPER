//
//  EditAccountPresenter.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 12/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

class EditAccountPresenter: EditAccountViewOutput, EditAccountInteractorOutput, EditAccountModuleInput {
    
    var interactor: EditAccountInteractor!
    var router: EditAccountRouterInput!
    var view: EditAccountViewInput!
    
    var accountToPresent: AccountStruct?
    
    //MARK: EditItemViewOutput
    
    func didTapCancelButton() {
        router.dismissInterface()
    }
    
    func didTapSaveButton(name: String) {
        interactor.saveItemWith(itemStruct: AccountStruct(id: nil, name: name))
        router.dismissInterface()
    }
    
    func viewIsReady() {
        view.clearAllFields()
        if let account = accountToPresent {
            view.fillFields(with: account)
        }
    }
    
    
    //MARK: EditItemInteractorOutput
    
    func successCallback() {
        router.dismissInterface()
    }
    
    func presentError(with message: String) {
        view.presentError(with: message)
    }
    
    func presentItemForEdition(itemStruct: BaseStruct) {
        view.clearAllFields()
        self.accountToPresent = itemStruct as? AccountStruct
    }
    
    
    //MARK: EditItemModuleInput
    
    func prepareEditionForNewItem() {
        
    }
    
    func prepareEditionForItem(with id: String) {
        interactor.prepareForEditionItem(with: id)
    }
    
}

