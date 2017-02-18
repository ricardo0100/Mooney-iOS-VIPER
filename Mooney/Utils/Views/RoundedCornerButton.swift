//
//  RoundedCornerButton.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 15/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class RoundedCornerButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCornerRadius(5.0)
    }
    
}
