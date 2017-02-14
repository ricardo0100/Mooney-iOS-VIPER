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
    
    var accounts: [String] = []

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: AccountsViewInput
    func setupInitialState() {
    }
    
    func show(_ accounts: [String]) {
        self.accounts = accounts
        tableView.reloadData()
    }
    
    // MARK: UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = accounts[indexPath.row]
        return cell
    }
    
}
