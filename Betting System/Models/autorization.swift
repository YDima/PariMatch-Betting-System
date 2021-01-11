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
    private var activeUserName: String?
    private var storage: Storage
    init(_ autorizationStorage: Storage) {
        activeUserName = nil
        storage = autorizationStorage
    }
    
    func login(_ username: String, _ password: String) throws{
        guard !self.otherUserInTheSystem() else {
            throw AuthorizationError.UserLoggedIn
        }
        guard !self.storage.isBanned(name: username) else{
            throw AuthorizationError.UserBanned
        }
        guard !self.storage.checkUser(name: username, password: password) else{
            throw AuthorizationError.WrongPassword
        }
        self.authorize(name: username)
     }

     func logout() {
        self.editUserState(name: activeUserName, newState: .unauthorized)
        activeUserName = nil;
     }
}

private extension Authorization {
    
    func editUserState(name: String?, newState: State){
        if(name == nil) {
            return
        }
        self.storage.editUserState(name: name!, newState: newState)
     }
     
    func authorize(name: String){
        editUserState(name: name, newState: .authorized)
        activeUserName = name
     }
     
     func otherUserInTheSystem() -> Bool{
        activeUserName != nil
     }
}
