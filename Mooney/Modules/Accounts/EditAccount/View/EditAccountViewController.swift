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

    @IBOutlet weak var accountNameTextField: RoundedFlatTextField!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        accountNameTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        accountNameTextField.resignFirstResponder()
    }
    

    // MARK: EditAccountViewInput
    func setupInitialState() {
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: RoundedCornerButton) {
        output.cancel()
    }
    
    @IBAction func saveButtonTapped(_ sender: RoundedCornerButton) {
        if let name = accountNameTextField.text {
            output.save(with: name)
        }
    }
    
    func presentValidationError(for field: String, and message: String) {
        
    }
    
    func presentError(with title: String, and message: String) {
        showAlert(with: title, and: message)
    }
    
}
