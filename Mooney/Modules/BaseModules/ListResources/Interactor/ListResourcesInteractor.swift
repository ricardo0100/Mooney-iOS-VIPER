//
//  AccountsAccountsInteractor.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import DATAStack

class ListResourcesInteractor<Entity: BaseEntity>: ListResourcesInteractorInput {

    weak var output: ListResourcesInteractorOutput!
    
    func fetchResourcesList() {
        do {
            let resources = try Entity.fetchAll()
            if resources.count == 0 {
                output.presentBlankstate()
            } else {
                output.presentListWith(resources)
            }
        } catch {
            output.presentError(with: "Oops!", and: "Error fetching!")
        }
    }
    
    func deleteResource(_ resource: BaseEntity, at index: Int) {
        do {
            try resource.delete()
            output.presentSuccessForResourceDeletionAt(index)
        } catch {
            output.presentError(with: "Oops!", and: "Error deleting!")
        }
    }
    
}
