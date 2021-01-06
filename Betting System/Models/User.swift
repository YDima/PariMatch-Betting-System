//
//  User.swift
//  Betting System
//
//  Created by Dmytro Yurchenko on 6.1.21.
//

import UIKit

protocol SystemUser {
     associatedtype State: Hashable
     associatedtype Role: Hashable
     
     var username: String { get set }
     var password: String { get set }
     var role: Role { get set } // regular or admin
     var state: State { get set } // authorized or banned or unauthorized
     
}

enum UserError: Error {
     case AccountAlreadyExists
     case AccountIsNotInThisSystem
     case PasswordIsDifferent
     case UserIsBanned
     case AnotherUserInTheSystem
     case CantBanAdmin
     case ThereIsNoBetsPlaced
}

enum State: Hashable {
     case authorized
     case unauthorized
     case banned
}

enum Role: Hashable {
     case admin
     case regular
}

class User: SystemUser {
     var username: String
     var password: String
     var role: Role
     var state: State
     
     init() {
          self.username = ""
          self.password = ""
          self.role = .regular
          self.state = .unauthorized
     }
     
     init(username: String, password: String, role: Role, state: State) {
          self.username = username
          self.password = password
          self.role = role
          self.state = state
     }
}
