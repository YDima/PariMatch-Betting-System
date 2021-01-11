//
//  registration.swift
//  Betting System
//
//  Created by Золотарева Марина Олеговна on 11.01.2021.
//

import Foundation

enum RegistrationError: Error {
        case usernameCount
        case passwordCount
        case userExists
}

protocol RegistrationProtocol {
    func registerNewUser(username: String, password: String,  role: Role, state: State) throws
}

class Registration: RegistrationProtocol  {
    
    private var storage = Storage()
    func registerNewUser (username: String, password: String,  role: Role, state: State = .unauthorized ) throws {
         if username.count < 1 || username.count > 20 {
             throw RegistrationError.usernameCount
         }
         if password.count < 8 || password.count > 20 {
             throw RegistrationError.passwordCount
         }
        if storage.isUserExist(username: username) {
             throw RegistrationError.userExists
         }
        let user = User(username: username, password: password, role: role, state: state)
        storage.addNewUser(user: user)
     }
     
}
