//
//  BaseMappableModel.swift
//  MVVMStudy
//
//  Created by Nabeesath on 03/11/20.
//  Copyright © 2020 Nabeesath. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseMapableModel: NSObject, Mappable {
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        
    }
    
    convenience override init() {
        self.init(args: nil)
        
    }
    
    init(args: Any?) {
        super.init()
    }
}
