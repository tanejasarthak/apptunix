//
//  SignupViewModel.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 15/07/21.
//

import Foundation

class SignupViewModel {
    func validateSignup(mobileNumber: String, confirmPassword: String, password: String) -> (status: Bool, message: String?) {
        if mobileNumber.count != 10 {
            return (status: false, message: Invalid_MobileNumber)
        } else if password.count < 6 {
            return (status: false, message: Invalid_Password)
        } else if password != confirmPassword {
            return (status: false, message: Password_Mismatch)
        }
        return (status: true, message: "")
    }
}
