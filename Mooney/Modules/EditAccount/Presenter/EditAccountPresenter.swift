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
    
    //MARK: EditAccountViewOutput
    
    func didTapCancelButton() {
        router.dismissInterface()
    }
    
    func didTapSaveButton(name: String) {
        interactor.saveAccountWithName(name: name)
    }
    
    func viewIsReady() {
        clearAllErrorMessages()
        interactor.presentItem()
    }
    
    
    //MARK: EditAccountInteractorOutput
    
    func successCallback() {
        router.dismissInterface()
    }
    
    func presentError(with title: String, and message: String) {
        view.presentError(with: title, and: message)
    }
    
    func presentItemForEditionWith(title: String, name: String) {
        view.setTitle(title: title)
        view.setNameField(name: name)
    }
    
    func presentError(for field: String, with message: String?) {
        switch field {
        case "name":
            view.setErrorForName(with: message)
        default:
            return
        }
    }
    
    
    //MARK: EditAccountModuleInput
    
    func prepareEditionForNewItem() {
        interactor.prepareNewItemForEdition()
    }
    
    func prepareEditionForItem(with id: String) {
        interactor.prepareForEditionItem(with: id)
    }
    
    
    //MARK: Private methods
    
    func clearAllErrorMessages() {
        view.setErrorForName(with: nil)
    }
    
}

