//
//  UserController.swift
//  o_X
//
//  Created by Eli Wirtshafter on 6/30/16.
//  Copyright © 2016 iX. All rights reserved.
//

import Foundation


class UserController {
    
    private var users = [User]()
    
    static var sharedInstance = UserController()
    
    var currentUser: User?
    
    func register(email email: String, password: String, onCompletion: (User?, String?) -> Void) {
        
        if email.isEmpty || password.isEmpty {
            return onCompletion(nil, "You must enter both a username and password.")
        }
        
        if !email.containsString("@") || !email.containsString(".") {
            return onCompletion(nil, "Enter a valid email address.")
        }
        
        for user in users {
            if user.email == email {
                return onCompletion(nil, "That email is already in use.")
            }
        }
        
        if password.characters.count < 6 {
            onCompletion(nil, "Password too short. Must be longer than 6 characters")
            return
        }
        
        currentUser = User(email: email, password: password)
        users.append(currentUser!)
        onCompletion(currentUser, nil)
    }
    
    func login(email email: String, password: String, onCompletion: (User?, String?) -> Void) {
        
        for user in users {
            if user.email == email && user.password == password {
                currentUser = user
                onCompletion(user, nil)
                return
            }
        }
        
        onCompletion(nil, "Email and/or password is incorrect.")
    }
    
    func logout(onCompletion onCompletion: (String?) -> Void) {
        currentUser = nil
        onCompletion(nil)
    }
    
}


