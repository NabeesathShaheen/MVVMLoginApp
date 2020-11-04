//
//  BaseApi.swift
//  MVVMStudy
//
//  Created by Nabeesath on 03/11/20.
//  Copyright © 2020 Nabeesath. All rights reserved.
//

import UIKit
import Alamofire

class BaseApi: NSObject {
    
    typealias RequestCompletion = (_ data: AnyObject?, _ error : BaseAPIError?) -> Void
    
    func requestUrl() -> String {
        return baseUrl
    }
    
    func requestMethod() -> HTTPMethod {
        return .post
    }
    
    func requestEncoding() -> ParameterEncoding{
        return JSONEncoding.default
    }
    
    func BaseUrl() -> String {
        return baseUrl
    }
    
    func performRequest(parameter: [String: Any]?,completion: @escaping RequestCompletion) {
        
            print("URL : " ,requestUrl())
            print("Parameters : ",(parameter ?? "nil"))
                
        AF.request(requestUrl(), method: requestMethod(), parameters: parameter, encoding: requestEncoding()).responseJSON { response in
                
                switch response.result {
                case .success(let JSON):
                    print("Success with JSON: \(JSON)")
                    self.performSuccessResponseWith(JSON as AnyObject? , and: completion)

                case .failure(let error):
                    print("Request failed with error: \(error)")
                    completion(nil, BaseAPIError.initWithHttpStatusCode(500))
                    self.performFailureResponseWith(response, completion: completion)
            }
        }
    }
    
    //MARK: Success Response Block
    func performSuccessResponseWith(_ value: AnyObject?, and completion: @escaping RequestCompletion) {
        let responseObject = self.processSuccessResponse(with: value)
        completion(responseObject, nil)
    }
    
    //MARK: Response processes - Override in subclass
    /**
     * Override this method to configure the process the response object.
     *
     * @return AnyObject
     */
    func processSuccessResponse(with response: Any?) -> BaseResponseModel?{
        return nil
    }
    
    
    //MARK: Failure Response Block
    
    func performFailureResponseWith(_ response: AFDataResponse<Any>, completion: RequestCompletion){
        if response.response == nil{
            //MARK: Request Failure Error with no response
        } else {
            //MARK: Request Failure Error with no response
            completion(nil, BaseAPIError.initWith(response.error))
        }
    }
}
