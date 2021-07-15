//
//  EndPointUrl.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 14/07/21.
//

import Foundation

enum EndPointUrl: String {
    case login = "login"
    case signup = "signup"
    case fetchImage = "static"
    case home = ""
}

enum RequestMethod: String {
    case post = "POST"
    case get = "GET"
}
