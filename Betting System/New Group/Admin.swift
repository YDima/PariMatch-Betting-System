//
//  Admin.swift
//  Betting System
//
//  Created by Dmytro Yurchenko on 6.1.21.
//

import UIKit

protocol AdminProtocol {
     func banRegularUser(username: String)
     func browseUsers()
}

class Admin: User, AdminProtocol {
  
     override init(username: String, password: String, role: Role = .admin, state: State) {
          super.init(username: username, password: password, role: role, state: state)
     }
     
     func banRegularUser(username: String)  {
          
     }

     func browseUsers() {
          
     }
}
