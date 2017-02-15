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
}
