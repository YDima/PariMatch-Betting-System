//
//  Storage.swift
//  BettingSystem
//
//  Created by Admin on 1/5/21.
//

import Foundation

class Storage {
     var bets: [Bet] = []
     var userBets: [String : [Bet]] = [:]

     init() {
          bets.append(Bet(name: "bet0"))
          bets.append(Bet(name: "bet1"))
          bets.append(Bet(name: "bet2"))
          bets.append(Bet(name: "bet3"))
          bets.append(Bet(name: "bet4"))
          bets.append(Bet(name: "bet5"))
          bets.append(Bet(name: "bet6"))
          bets.append(Bet(name: "bet7"))
     }
     
}

//MARK: - RegularUser
extension Storage {
     func addBetsToUser(username: String, bets: [Bet]) {
          userBets.updateValue(bets, forKey: username)
     }

     func viewAllUserBets() {
          
     }
}

//MARK: - Admin
extension Storage {
     func banUser() {
      
     }

     func browseUsers() {
      
     }
}
