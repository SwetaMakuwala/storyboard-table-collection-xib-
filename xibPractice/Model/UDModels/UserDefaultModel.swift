//
//  OutputModel.swift
//  xibPractice
//
//  Created by Dhaval Dobariya on 03/02/22.
//

import Foundation
struct UserDefaultModel : Codable{
    var name: String
    var address: String
    var email: String
  
}
class UserDefaultClass : Codable{
    var name: String
    var address: String
    var email: String
    init(name: String, address: String, email: String){
        self.name = name
        self.address = address
        self.email = email
    }
}
