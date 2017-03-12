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
    
    func clearAllFields() {
        nameTextField.text = ""
    }
    
    func fillFields(with itemStruct: BaseStruct) {
        let account = itemStruct as! AccountStruct
        nameTextField.text = account.name
    }
    
    func presentError(with message: String) {
        showAlert(with: "Warning", and: message)
    }
    
}

