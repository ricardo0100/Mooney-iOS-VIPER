//
//  EditAccountEditAccountInteractor.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 15/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import DATAStack

class EditAccountInteractor: EditAccountInteractorInput {

    weak var output: EditAccountInteractorOutput!
    
    var dataStack: DATAStack
    
    required init(dataStack: DATAStack) {
        self.dataStack = dataStack
    }
    
    func saveAccount(with name: String) {
        if name.isEmpty {
            output.presentValidationError(for: "name", and: "Account name should not be empty")
        } else {
            let account = NSEntityDescription.insertNewObject(forEntityName: "Account", into: dataStack.mainContext) as! Account
            account.name = name
            do {
                try dataStack.mainContext.save()
                output.presentSuccess()
            } catch {
                print("Error saving account: \(error)")
                output.presentError(with: "Oops!", and: "Error while saving new Account")
            }
        }
    }
    
}
