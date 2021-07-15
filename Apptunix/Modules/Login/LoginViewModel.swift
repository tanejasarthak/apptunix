//
//  LoginViewModel.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 15/07/21.
//

import Foundation

class LoginViewModel {
    func validateLoginDetails(mobileNumber: String, password: String) -> (status: Bool, message: String?) {

        if mobileNumber.count != 10 {
            return (status: false, message: Invalid_MobileNumber)
        } else if password.count < 6 {
            return (status: false, message: Invalid_Password)
        }
        
        return (status: true, message: nil)
    }
}
