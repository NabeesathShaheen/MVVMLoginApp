//
//  BaseApiError.swift
//  MVVMStudy
//
//  Created by Nabeesath on 03/11/20.
//  Copyright © 2020 Nabeesath. All rights reserved.
//

import Foundation

enum HTTPErrorType {
    case none
    case timeOut
    case network
    case authentication
    case response
    case request
    case server
    case generic
}

class BaseAPIError: NSObject {
    
    var code: Int?
    var type: HTTPErrorType = .none
    var message : String?
    
    
    class func getErrorObjectForHttpStatus(_ status: Int) -> BaseAPIError {
        let apiError = BaseAPIError()
        
        switch status {
        case HTTP_STATUS_OK, HTTP_STATUS_CREATED  :   apiError.type = .none                 // 200, 201
        apiError.message = "Success"
            break
        case HTTP_STATUS_NO_CONTENT               :   apiError.type = .response             // 204
        apiError.message = "No response found"
            break
        case HTTP_STATUS_BAD_REQUEST, HTTP_STATUS_NOT_FOUND  :   apiError.type = .request              // 400 , 404
        apiError.message = "Problem is in request"
            break
        case HTTP_STATUS_UNAUTHORIZED             :   apiError.type = .authentication       // 401
        apiError.message = "Authentication failure"
            break
        case HTTP_STATUS_INTERNAL_SERVER_ERROR    :   apiError.type = .server               // 500
        apiError.message = "Service unavailable now, please try again later"
            break
        default                                   :   apiError.type = .generic
        apiError.message = "Unknown Error"
        }
        
        return apiError
        
    }
    
    override init() {
        super.init()
        code = 0
    }
    
    class func initWithHttpStatusCode(_ httpStatusCode: Int) -> BaseAPIError{
        var apiError = BaseAPIError()
        apiError = getErrorObjectForHttpStatus(httpStatusCode)
        return apiError
    }
    
    class func initWith(_ error : Error?) -> BaseAPIError{
        
        let responseError = BaseAPIError()
        responseError.code = (error as NSError?)?.code
        responseError.type = .generic
        if (((error as NSError?)?.userInfo[ErrorLocalizedDescription]) != nil) {
            responseError.message = (error as NSError?)?.userInfo[ErrorLocalizedDescription] as? String
        }
        else {
            responseError.message = "Unknown api error"
        }
        return responseError
        
    }
    
    class func initErrorWith(_ errorObject: BaseAPIError,and error : NSError?) -> BaseAPIError{
        
        errorObject.code = error?.code
        if ((error?.userInfo[ErrorLocalizedDescription]) != nil) {
            errorObject.message = error?.userInfo[ErrorLocalizedDescription] as? String
        }
        else {
            errorObject.message = "Unknown api error"
        }
        return errorObject
        
    }

}
