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
    
    func save(account object: Account?, with name: String) {
        var object = object
        if object == nil {
            object = Account.newObject(in: dataStack.mainContext)
            object!.createdAt = NSDate()
        }
        
        if let account = object {
            if name.isEmpty {
                output.presentValidationError(for: "name", and: "Account name should not be empty")
                dataStack.mainContext.rollback()
            } else {
                account.name = name
                account.updatedAt = NSDate()
                do {
                    try dataStack.mainContext.save()
                    output.presentSuccess()
                } catch {
                    print("Error saving account: \(error)")
                    output.presentError(with: "Oops!", and: "Error while saving new Account")
                    dataStack.mainContext.rollback()
                }
            }
        }
    }
    
}
