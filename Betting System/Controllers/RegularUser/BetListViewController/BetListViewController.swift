//
//  BetListViewController.swift
//  BettingSystem
//
//  Created by Admin on 1/5/21.
//

import UIKit





// ------------------------------------------------------------------------------------

class BetListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private let storage = Storage()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func logoutAction(_ sender: UIBarButtonItem) {
    }
    
}

// MARK: - UITableViewDataSource
extension BetListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storage.bets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BetTableViewCell", for: indexPath)
        cell.textLabel?.text = storage.bets[indexPath.row].name
        
        return cell
    }
    
}
