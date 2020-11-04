//
//  ApiManager.swift
//  MVVMStudy
//
//  Created by Nabeesath on 03/11/20.
//  Copyright © 2020 Nabeesath. All rights reserved.
//

import Foundation

class ApiManager: NSObject {
    
    typealias RequestCompletion = (_ data: AnyObject?, _ error : BaseAPIError?) -> Void
    
    static func loginApi(requestData: LoginApiRequest? = nil, completion:@escaping RequestCompletion) {
        let api = LoginApi()
        api.postLoginData(request: requestData!, completion: completion)
    }
}
