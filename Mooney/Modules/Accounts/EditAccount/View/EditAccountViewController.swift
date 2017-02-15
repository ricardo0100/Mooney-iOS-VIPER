//
//  EditAccountEditAccountViewController.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 15/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import UIKit

class EditAccountViewController: UIViewController, EditAccountViewInput {

    var output: EditAccountViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: EditAccountViewInput
    func setupInitialState() {
    }
}
