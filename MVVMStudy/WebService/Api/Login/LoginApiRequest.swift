//
//  LoginApiRequest.swift
//  MVVMStudy
//
//  Created by Nabeesath on 03/11/20.
//  Copyright © 2020 Nabeesath. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginApiRequest: BaseMapableModel {
    
    var email: String?
    var password: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        email <- map["email"]
        password <- map["password"]
    }
}
