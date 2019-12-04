//
//  User.swift
//  FriendFace
//
//  Created by Yihwan Kim on 11/28/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String?
    var tags: [String]?
    var friends: [Friend]?
    
    init() {
        self.id = "unique key"
        self.isActive = true
        self.name = "Yihwan Kim"
        self.age = 28
        self.company = "Curology"
        self.email = "whatever@gmail.com"
        self.address = "213 Main Street"
        self.about = "Helo World"
        self.registered = nil
        self.tags = nil
        self.friends = nil
    }
}
