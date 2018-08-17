//
//  AuthorizationService.swift
//  Smack
//
//  Created by Johnny Young on 8/14/18.
//  Copyright © 2018 Johnny Young. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

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
}

extension AuthorizationService {
    
    func registerUser(email: String, password: String, completion: @escaping(_ Success: Bool) -> ()) {
        let userEmail = email.lowercased()
        let body: [String: Any] = [
            "email": userEmail,
            "password": password
        ]
        
        Alamofire.request(registerURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            
            switch response.result {
            case .success:
                completion(true)
            case .failure:
                completion(false)
                debugPrint("Error: \(response.result.error as Any)  ")
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping (_ Success: Bool) -> ()) {
        let userEmail = email.lowercased()
        let body : [String: Any] = [
            "email": userEmail,
            "password": password
        ]
        
        Alamofire.request(loggedInURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            switch response.result {
            case .success:
                guard let value = response.result.value else { return }
                let loginJSON = JSON(value)
                self.parseLogin(json: loginJSON)
                self.isLoggedIn = true
                completion(true)
            case .failure:
                completion(false)
                debugPrint("Error : \(response.result.error as Any)")
            }
        }
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping (_ Success: Bool) -> ()) {
        let userEmail = email.lowercased()
        let body : [String: Any] = [
            "name": name,
            "email": userEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        Alamofire.request(addUserURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: addUserHeader).responseJSON { (response) in
            
            switch response.result {
            case .success:
                guard let value = response.result.value else { return }
                let createUserJSON = JSON(value)
                self.parseCreateUser(json: createUserJSON)
                completion(true)
            case .failure:
                completion(false)
                debugPrint("Error : \(response.result.error as Any)")
            }
        }
    }
    
    func parseLogin(json: JSON) {
        guard let user = json["user"].string else { return }
        let token = json["token"].stringValue
        email = user
        authorizationToken = token
    }
    
    func parseCreateUser(json: JSON) {
        guard let userID = json["_id"].string else { return }
        let userName = json["name"].stringValue
        let userEmail = json["email"].stringValue
        let avatarName = json["avatarName"].stringValue
        let avatarColor = json["avatarColor"].stringValue
        UserDataService.shared.setUserData(id: userID, name: userName, email: userEmail, avatarName: avatarName, avatarColor: avatarColor)
    }
    
    
}
