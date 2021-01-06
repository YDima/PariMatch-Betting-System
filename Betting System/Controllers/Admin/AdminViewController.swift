//
//  AdminViewController.swift
//  Betting System
//

import UIKit

class AdminViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    private let storage = Storage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "AdminBanTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "AdminBanTableViewCell")
    }
    
    @IBAction func logoutAction(_ sender: UIBarButtonItem) {
    }
    
}

// MARK: - UITableViewDataSource
extension AdminViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storage.bets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdminBanTableViewCell", for: indexPath) as! AdminBanTableViewCell
        cell.usernameLabel?.text = storage.bets[indexPath.row].name
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension AdminViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
}
