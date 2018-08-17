//
//  SmackUser.swift
//  Smack
//
//  Created by Johnny Young on 8/16/18.
//  Copyright © 2018 Johnny Young. All rights reserved.
//

import Foundation

struct SmackUser {
    
    private(set) public var id: String
    private(set) public var name: String
    private(set) public var email: String
    private(set) public var avatarName: String
    private(set) public var avatarColor: String
    
    init(id: String, name: String, email: String, avatarName: String, avatarColor: String ) {
        self.id = id
        self.name = name
        self.email = email
        self.avatarName = avatarName
        self.avatarColor = avatarColor
    }
}
