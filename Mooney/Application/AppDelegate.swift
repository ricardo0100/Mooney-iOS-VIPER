//
//  AppDelegate.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/17.
//  Copyright © 2017 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        printAppDocumentsPath()
        return true
    }
    
    func printAppDocumentsPath() {
        print("📄Documents path: \(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])")
    }

}

