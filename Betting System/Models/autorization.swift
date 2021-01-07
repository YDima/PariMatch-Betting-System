//
//  autorization.swift
//  Betting System
//
//  Created by Maryna Zolotarova on 07.01.2021.
//

import Foundation

protocol AuthorizationProtocol {
     func login(_ username: String, _ password: String) throws
     func logout()
}

enum AuthorizationError: Error {
    case UserLoggedIn;
    case UserBanned;
    case WrongPassword;
}

class Authorization: AuthorizationProtocol {
    private var activeUser: User?
    private var storage: Storage
    init(_ autorizationStorage: Storage) {
        activeUser = nil
        storage = autorizationStorage
    }
    
    func login(_ username: String, _ password: String) throws{
        guard !self.otherUserInTheSystem() else {
            throw AuthorizationError.UserLoggedIn
        }
        guard !self.storage.isBanned(username) else{
            throw AuthorizationError.UserBanned
        }
        guard !self.storage.checkUser(username, password) else{
            throw AuthorizationError.WrongPassword
        }
        self.authorize(user: self.storage.findUser(username, password))
     }

     func logout() {
        self.editUserState(user: &activeUser, newState: .unauthorized)
        activeUser = nil;
     }
}

private extension Authorization {
    
    func editUserState( user: inout User?, newState: State){
        if(user == nil) {
            return
        }
        user!.state = newState;
     }
     
    func authorize( user: inout User?) throws {
        editUserState(user: &user, newState: .authorized)
        activeUser = user
     }
     
     func otherUserInTheSystem() -> Bool{
        if activeUser != nil  {
            return true
        }
        return false
     }
}
