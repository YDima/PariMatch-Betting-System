//
//  RegularUser.swift
//  Betting System
//
//  Created by Dmytro Yurchenko on 6.1.21.
//

import UIKit

protocol RegularUserProtocol {
     func placeBet(bet: Bet)
     
     func printAllBets()
}

class RegularUser: User, RegularUserProtocol {
     
     private var bets: [Bet] = []
     
     override init(username: String, password: String, role: Role = .regular, state: State) {
          super.init(username: username, password: password, role: role, state: state)
     }
     
     func placeBet(bet: Bet) {
          
     }
     
     func printAllBets() {
          
     }
}
