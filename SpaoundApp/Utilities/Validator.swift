//
//  Validator.swift
//  SpaoundApp
//
//  Created by Noor Walid on 18/04/2021.
//

import Foundation

struct Validator {
    
    func isValidInput(email: String, password: String, name: String, phone: String) -> Bool {
        
        //Check using Regular expressions
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        
        let namePred = NSPredicate(format: "SELF MATCHES %@", "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$")
        
        //        let phoneRegEx = "^\\d{3}-\\d{3}-\\d{4}$"
        //        let phonePred = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        
        //Check using computed values
        var result: Bool {
            if !phone.isEmpty, phone.count == 10, phone.starts(with: "1") {
                return true
            }
            else{
                return false
            }
        }
        
        return emailPred.evaluate(with: email) && passwordPred.evaluate(with: password) && namePred.evaluate(with: name) && result
    }
}
