//
//  AccountsAccountsViewController.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import UIKit

class AccountsViewController: UITableViewController, ListResourcesViewInput {

    var output: ListResourcesViewOutput!
    
    
    // MARK: Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.refreshResourcesList()
    }
    
    
    // MARK: ListResourcesViewInput
    
    func showList() {
        tableView.reloadData()
    }
    
    func showBlankstate() {
        
    }
    
    func removeCellFromList(at index: Int) {
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath.init(row: index, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    
    // MARK: UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.numberOfItems()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = output.resourceForItem(at: indexPath.row) as! Account
        cell.textLabel?.text = item.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.output.didTapDeleteActionFotItem(at: indexPath.row)
        }
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            self.output.didTapEditActionFotItem(at: indexPath.row)
        }
        
        return [deleteAction, editAction]
    }
    
    
    //MARK: User events
    
    @IBAction func newAccountButtonTapped(_ sender: Any) {
        output.didTapNewButton()
    }
    
}
