//
//  ViewController.swift
//  BettingSystem
//
//  Created by Admin on 1/5/21.
//

import UIKit

class MakeBetViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private let storage = Storage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "MakeBetTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "MakeBetTableViewCell")
    }

    @IBAction func logoutAction(_ sender: UIBarButtonItem) {
    }
    
}

// MARK: - UITableViewDataSource
extension MakeBetViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storage.bets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MakeBetTableViewCell", for: indexPath) as! MakeBetTableViewCell
        cell.betDescriptionLabel?.text = storage.bets[indexPath.row].name
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension MakeBetViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
}
