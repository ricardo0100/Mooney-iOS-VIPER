//
//  EditAccountEditAccountViewOutput.swift
//  Mooney
//
//  Created by Ricardo Gehrke Filho on 15/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

protocol EditAccountViewOutput {

    /**
        @author Ricardo Gehrke Filho
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    func cancel()
    
    func save(account object: Account?, with name: String)
    
}
