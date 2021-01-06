//
//  MakeBetTableViewCell.swift
//  BettingSystem
//
//  Created by Admin on 1/5/21.
//

import UIKit

class MakeBetTableViewCell: UITableViewCell {

    @IBOutlet weak var betDescriptionLabel: UILabel!
    @IBOutlet weak var makeBetButton: UIButton!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    @IBAction func makeBetAction(_ sender: UIButton) {
        print("make bet")
    }
}
