//
//  AccountsAccountsInteractor.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import DATAStack

class ListResourcesInteractor<Model: BaseModel>: ListResourcesInteractorInput {

    weak var output: ListResourcesInteractorOutput!
    
    var dataStack: DATAStack
    var entityName: String
    
    init(with dataStack: DATAStack, andEntityName name: String) {
        self.dataStack = dataStack
        self.entityName = name
    }
    
    func fetchList() {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            if let result = try dataStack.mainContext.fetch(fetchRequest) as? [Model] {
                output.presentList(with: result)
            } else {
                output.presentError()
            }
        } catch {
            output.presentError()
        }
    }
    
    func deleteResource(_ resource: NSManagedObject) {
        
    }
    
}
