//
//  ViewController.swift
//  Betting System
//
//  Created by Dmytro Yurchenko on 4.1.21.
//

import UIKit

protocol AuthorizationProtocol {
     func login(_ username: String, _ password: String)
     func register(_ username: String, _ password: String, _ role: User.Role)
     func logout()
}

class Authorization: AuthorizationProtocol {
     
     func register(_ username: String, _ password: String, _ role: User.Role) {
          
     }
     
     func login(_ username: String, _ password: String) {
          
     }

     func logout() {
          
     }
     // private extension
     func isNew(username: String) -> Bool {
          return true
     }
     
     func checkPassword(user: User, password: String) -> Bool {
          return true
     }
     
     func editUserState(user: User, newState: State) -> User {
          return user
     }
     
     func authorize(user: User) throws {
          
     }
     
     func otherUserInTheSystem() -> Bool{
          return true
     }
     
}

struct Bet {
     var value: String
}

struct Storage {
     var users: [User] = []
     var bets: [String: [Bet]] = [:]
}

class BettingSystem {
     private var authorization = Authorization()
     private var storage = Storage()
     
     func login(username: String, password: String) {
          authorization.login(username, password)
     }
     
}
