//
//  Constants.swift
//  Smack
//
//  Created by Johnny Young on 8/14/18.
//  Copyright © 2018 Johnny Young. All rights reserved.
//

import Foundation

// URL's:
let baseURL = "https://chattychatchat1.herokuapp.com/v1/"
let registerURL = "\(baseURL)account/register"
let loggedInURL = "\(baseURL)account/login"
let addUserURL = "\(baseURL)user/add"

// User Defaults:
let loggedInKey = "loggedIn"
let tokenKey = "token"
let userEmail = "userEmail"

// API Headers:
let header = ["Content-Type": "application/json; charset=utf-8"]
let addUserHeader = ["Authorization": " Bearer \(AuthorizationService.shared.authorizationToken)", "Content-Type": "application/json; charset=utf-8"]

