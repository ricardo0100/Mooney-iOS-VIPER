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
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
