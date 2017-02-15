//
//  EditAccountEditAccountInitializer.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 15/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import UIKit

class EditAccountModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var editaccountViewController: EditAccountViewController!

    override func awakeFromNib() {

        let configurator = EditAccountModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: editaccountViewController)
    }

}
