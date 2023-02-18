//
//  AuthValidation.swift
//  Messendev
//
//  Created by Иван Карплюк on 05.02.2023.
//

import UIKit

struct Validators {
    
    func isFilled(email: String?, password: String?, phone: String?) -> Bool {
        guard let password = password,
              let phone = phone,
              let email = email,
              password != "",
              phone != "",
              email != "" else {
                return false
        }
              return true
    }
    
    func isValidPassword(password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,}")
        return passwordTest.evaluate(with: password)
    }
    
    func isSimpleEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

}
