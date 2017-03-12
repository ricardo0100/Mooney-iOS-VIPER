//
//  EditAccountViewController.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 03/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class EditAccountViewController: UIViewController, EditItemViewInput {
    
    var output: EditItemViewOutput!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        output.didTapSaveButton(name: nameTextField.text!)
    }

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        output.didTapCancelButton()
    }
    
}
