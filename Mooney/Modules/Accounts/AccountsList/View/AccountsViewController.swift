//
//  AccountsAccountsViewController.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import UIKit

class AccountsViewController: UITableViewController, AccountsViewInput {

    var output: AccountsViewOutput!
    
    var accounts: [Account] = []
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.refreshAccountsList()
    }
    
    
    // MARK: AccountsViewInput
    
    func setupInitialState() {
    }
    
    func showList(with accounts: [Account]) {
        self.accounts = accounts
        tableView.reloadData()
    }
    
    func showBlankstate() {
        
    }
    
    func removeFromViewListAccount(at index: Int) {
        tableView.beginUpdates()
        accounts.remove(at: index)
        tableView.deleteRows(at: [IndexPath.init(row: index, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    
    // MARK: UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = accounts[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            let account = self.accounts[indexPath.row]
            self.output.deleteAccount(account, at: indexPath.row)
        }
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            self.output.presentEditViewForAccount(at: indexPath.row)
        }
        
        return [deleteAction, editAction]
    }
    
    
    //MARK: User events
    
    @IBAction func newAccountButtonTapped(_ sender: Any) {
        output.presentNewAccountView()
    }
    
}
