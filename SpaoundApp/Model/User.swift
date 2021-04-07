//
//  User.swift
//  SpaoundApp
//
//  Created by Noor Walid on 06/04/2021.
//

import Foundation

class User {
    var name: String
    var email: String
    var password: String
    var phoneNumber: String
    var isLoggedIn: Bool = false
    
    init(name: String, email: String, password: String, phoneNumber: String) {
        self.name = name
        self.email = email
        self.password = password
        self.phoneNumber = phoneNumber
    }
}
