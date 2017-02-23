//
//  ListResourcesViewInputDouble.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 22/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import Foundation

@testable import Mooney

class ListResourcesViewInputDouble: ListResourcesViewInput {
    
    var didShowList = false
    var didShowBlankstate = false
    var didShowAlert = false
    var didRemoveCellFromList = false
    
    func showList() {
        didShowList = true
    }
    
    func showBlankstate() {
        didShowBlankstate = true
    }
    
    func showAlert(with title: String, and message: String) {
        didShowAlert = true
    }
    
    func removeCellFromList(at index: Int) {
        didRemoveCellFromList = true
    }
    
}
