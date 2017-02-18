//
//  UIViewExtensions.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 15/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

extension UIView {
    
    func setCornerRadius(_ radius: Double) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = CGFloat(radius)
    }
    
}
