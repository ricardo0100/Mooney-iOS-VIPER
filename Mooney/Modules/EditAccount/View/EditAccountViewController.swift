//
//  EditAccountViewController.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 03/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class EditAccountViewController: UIViewController, EditAccountViewInput {
    
    var output: EditAccountViewOutput!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        output.viewIsReady()
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        output.didTapSaveButton(name: nameTextField.text!)
    }

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        output.didTapCancelButton()
    }
    
    func setTitle(title: String) {
        self.title = title
    }
    
    func fillFieldsWith(name: String) {
        nameTextField.text = name
    }
    
    func presentError(with title: String, and message: String) {
        showAlert(with: title, and: message)
    }
    
}

