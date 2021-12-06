//
//  user.swift
//  Tournoi4

import Foundation

struct User: Encodable {
    internal init(username: String? = nil, email: String? = nil, password: String? = nil, _id: String? = nil) {
        self.username = username
        self.email = email
        self.password = password
        self._id = _id
    }
    

    var username : String?
    var email : String?
    var password : String?
    var _id : String?
}
