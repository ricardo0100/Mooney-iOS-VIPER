//
//  EditAccountEditAccountConfigurator.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 15/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import UIKit
import DATAStack

class EditAccountModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? EditAccountViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: EditAccountViewController) {

        let router = EditAccountRouter(withRoot: viewController)

        let presenter = EditAccountPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = EditAccountInteractor(dataStack: DATAStack(modelName: "MooneyDataModel"))
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
