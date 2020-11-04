//
//  LoginApi.swift
//  MVVMStudy
//
//  Created by Nabeesath on 03/11/20.
//  Copyright © 2020 Nabeesath. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class LoginApi: BaseApi {
    
    override func requestUrl() -> String {
        return baseUrl + loginUrl
    }
    
    func postLoginData(request: LoginApiRequest,completion: @escaping RequestCompletion) {
        performRequest(parameter: request.toJSON(), completion: completion)
    }
    
    override func processSuccessResponse(with response: Any?) -> BaseResponseModel? {
        return Mapper<LoginApiResponse>().map(JSONObject:response)
    }
}

