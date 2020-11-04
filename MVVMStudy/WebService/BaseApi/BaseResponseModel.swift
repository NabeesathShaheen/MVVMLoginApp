//
//  BaseResponseModel.swift
//  MVVMStudy
//
//  Created by Nabeesath on 03/11/20.
//  Copyright © 2020 Nabeesath. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseResponseModel: BaseMapableModel {
    
    var message: String? = ""
    
    override func mapping(map: Map) {
        
        message <- map["error"]

    }
}
