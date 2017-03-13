//
//  EditAccountPresenter.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 12/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

class EditAccountPresenter: EditAccountViewOutput, EditAccountInteractorOutput, EditAccountModuleInput {
    
    var interactor: EditAccountInteractorInput!
    var view: EditAccountViewInput!
    var router: EditAccountRouterInput!
    
    //MARK: EditItemViewOutput
    
    func didTapCancelButton() {
        router.dismissInterface()
    }
    
    func didTapSaveButton(name: String) {
        interactor.saveAccountWithName(name: name)
    }
    
    func viewIsReady() {
        interactor.presentItem()
    }
    
    
    //MARK: EditItemInteractorOutput
    
    func successCallback() {
        router.dismissInterface()
    }
    
    func presentError(with title: String, and message: String) {
        view.presentError(with: title, and: message)
    }
    
    func presentItemForEditionWith(name: String) {
        view.fillFieldsWith(name: name)
    }
    
    
    //MARK: EditItemModuleInput
    
    func prepareEditionForNewItem() {
        interactor.prepareNewItemForEdition()
    }
    
    func prepareEditionForItem(with id: String) {
        interactor.prepareForEditionItem(with: id)
    }
    
}

