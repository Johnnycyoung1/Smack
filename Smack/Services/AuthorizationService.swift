//
//  AuthorizationService.swift
//  Smack
//
//  Created by Johnny Young on 8/14/18.
//  Copyright © 2018 Johnny Young. All rights reserved.
//

import Foundation
import Alamofire

class AuthorizationService {
    static let shared = AuthorizationService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: loggedInKey)
        }
        set {
            defaults.set(newValue, forKey: loggedInKey)
        }
    }
    var authorizationToken: String {
        get {
            return defaults.value(forKey: tokenKey) as! String
        }
        set {
            defaults.set(newValue, forKey: tokenKey)
        }
    }
    var email: String {
        get {
            return defaults.value(forKey: userEmail) as! String
        }
        set {
            defaults.set(newValue, forKey: userEmail)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping(_ Success: Bool) -> ()) {
        let userEmail = email.lowercased()
        let header = ["Content-Type": "application/json; charset=utf-8"]
        let body: [String: Any] = ["email": userEmail, "password": password]
        
        Alamofire.request(registerURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            
            switch response.result {
            case .success:
                completion(true)
            case .failure:
                guard let error = response.result.error else {return}
                completion(false)
                debugPrint("Error: \(error)")
            }
        }
    }
    
    
    
    
}
