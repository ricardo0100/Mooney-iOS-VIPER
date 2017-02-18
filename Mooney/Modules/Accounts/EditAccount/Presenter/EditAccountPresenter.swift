//
//  EditAccountEditAccountPresenter.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 15/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

class EditAccountPresenter: EditAccountModuleInput, EditAccountViewOutput, EditAccountInteractorOutput {

    weak var view: EditAccountViewInput!
    var interactor: EditAccountInteractorInput!
    var router: EditAccountRouterInput!

    func viewIsReady() {

    }
    
    func save(with name: String) {
        interactor.saveAccount(with: name)
    }
    
    func cancel() {
        router.dismissViewController()
    }
    
    func presentSuccess() {
        router.dismissViewController()
    }
    
    func presentValidationError(for field: String, and message: String) {
        
    }
    
    func presentError(with title: String, and message: String) {
        view.presentError(with: title, and: message)
    }
    
}
