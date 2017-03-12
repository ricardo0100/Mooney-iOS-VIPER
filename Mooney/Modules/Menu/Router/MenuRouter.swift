//
//  MenuRouter.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 12/03/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class MenuRouter: NSObject {
    
    @IBOutlet weak var menuTabBarController: UITabBarController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureModule()
    }
    
    func configureModule() {
        let storyboard = UIStoryboard(name: "ListAccounts", bundle: nil)
        let listAccounts = storyboard.instantiateInitialViewController()
        menuTabBarController.viewControllers = [listAccounts!]
    }
    
}
