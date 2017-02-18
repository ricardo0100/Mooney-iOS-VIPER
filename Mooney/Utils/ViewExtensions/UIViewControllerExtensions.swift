//
//  ViewController+AlertMessages.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 15/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit


extension UIViewController {
    
    func showAlert(with title: String, and message: String) {
        let alert = UIAlertController.init(title: title, message:message, preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
    }
    
}
