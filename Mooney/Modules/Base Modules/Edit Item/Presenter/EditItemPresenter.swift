//
//  EditItemPresenter.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 28/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

class EditItemPresenter: EditItemModuleInput, EditItemViewOutput, EditItemInteractorOutput {
    
    var router: EditItemRouterInput!
    var interactor: EditItemInteractorInput!
    
    func didTapCancelButton() {
        router.dismissInterface()
    }

    func didTapSaveButton(name: String) {
        interactor.saveItemWith(name: name)
    }
    
}
