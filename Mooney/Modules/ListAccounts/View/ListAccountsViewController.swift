//
//  AccountsAccountsViewController.swift
//  Mooney-iOS-VIPER
//
//  Created by Ricardo Gehrke Filho on 12/02/2017.
//  Copyright © 2017 ricardofilho.com.br. All rights reserved.
//

import UIKit

class ListAccountsViewController: UIViewController, ListAccountsViewInput {
    
    var output: ListAccountsViewOutput!
    
    @IBOutlet var blankstateView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(blankstateView)
        blankstateView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.fetchItems()
    }
    
    
    // MARK: ListItemsViewInput
    
    func showList() {
        tableView.reloadData()
    }
    
    func showBlankstate() {
        blankstateView.isHidden = false
        tableView.isHidden = true
    }
    
    func hideBlankstate() {
        blankstateView.isHidden = true
        tableView.isHidden = false
    }
    
    func removeCellFromList(at index: Int) {
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath.init(row: index, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    
    //MARK: User events
    
    @IBAction func newAccountButtonTapped(_ sender: UIBarButtonItem) {
        output.didTapNewItemButton()
    }
    
}

extension ListAccountsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = output.itemName(at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.output.deleteItem(at: indexPath.row)
        }
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            self.output.presentEditInterfaceForItem(at: indexPath.row)
        }
        
        return [deleteAction, editAction]
    }
    
}

