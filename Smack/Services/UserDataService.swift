//
//  UserService.swift
//  Smack
//
//  Created by Johnny Young on 8/16/18.
//  Copyright © 2018 Johnny Young. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let shared = UserDataService()
    
    private(set) public var users = [SmackUser]()
    
    func setUserData(id: String, name: String, email: String, avatarName: String, avatarColor: String) {
        users = [SmackUser.init(id: id, name: name, email: email, avatarName: avatarName, avatarColor: avatarColor)]
    }
}
