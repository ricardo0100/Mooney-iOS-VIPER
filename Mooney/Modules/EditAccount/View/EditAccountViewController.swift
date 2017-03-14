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
    @IBOutlet weak var nameErrorLabel: UILabel!
    
    
    //MARK: View Controller Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        output.viewIsReady()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        nameTextField.resignFirstResponder()
    }
    
    
    //MARK: User actions
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        output.didTapSaveButton(name: nameTextField.text!)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        output.didTapCancelButton()
    }
    
    
    //MARK: EditAccountViewInput
    
    func setTitle(title: String) {
        self.title = title
    }
    
    func setNameField(name: String) {
        nameTextField.text = name
    }
    
    func presentError(with title: String, and message: String) {
        showAlert(with: title, and: message)
    }
    
    func setErrorForName(with message: String?) {
        nameErrorLabel.text = message
    }
    
}

