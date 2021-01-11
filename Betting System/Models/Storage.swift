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
    private var users: [String: User] = [:]
    
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
//MARK: - Authorization
extension Storage{
    func isBanned(name: String) -> Bool {
        return users[name]?.state == .banned
    }
    
    func checkUser(name: String, password: String) -> Bool {
        guard let user = users[name] else {
            return false
        }
        
        if user.password == password {
            return true
        }
        
        return false
    }
    func editUserState(name: String, newState: State){
        self.users[name]?.state = newState
    }
}
//MARK: - Registration
extension Storage {
    
    func addNewUser(user: User) {
        users[user.username] = user
    }
    
    func isUserExist(username: String) -> Bool {
        users[username] != nil
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
