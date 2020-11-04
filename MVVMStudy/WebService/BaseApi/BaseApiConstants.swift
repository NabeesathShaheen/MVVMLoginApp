//
//  BaseApiConstants.swift
//  MVVMStudy
//
//  Created by Nabeesath on 03/11/20.
//  Copyright © 2020 Nabeesath. All rights reserved.
//

import Foundation

//MARK: - URLs
public let baseUrl = "https://reqres.in/api/"
public let loginUrl = "login"

//MARK: HTTP Status codes
public let HTTP_STATUS_OK                      = 200
public let HTTP_STATUS_CREATED                 = 201
public let HTTP_STATUS_ACCEPTED                = 202
public let HTTP_STATUS_PARTIAL_RESPONSE        = 203
public let HTTP_STATUS_NO_CONTENT              = 204

public let HTTP_STATUS_MOVED                   = 301
public let HTTP_STATUS_FOUND                   = 302
public let HTTP_STATUS_METHOD                  = 303
public let HTTP_STATUS_NOT_MODIFIED            = 303

public let HTTP_STATUS_BAD_REQUEST             = 400
public let HTTP_STATUS_UNAUTHORIZED            = 401
public let HTTP_STATUS_FORBIDDEN               = 403
public let HTTP_STATUS_NOT_FOUND               = 404

public let HTTP_STATUS_INTERNAL_SERVER_ERROR   = 500
public let HTTP_STATUS_NOT_IMPLEMENTED         = 501
public let HTTP_STATUS_SERVICE_OVERLOADED      = 502
public let HTTP_STATUS_GATEWAY_TIMEOUT         = 503

//MARK: app utility Keys
public let ErrorLocalizedDescription = "NSLocalizedDescription"
public let CONTENT_TYPE_KEY = "Content-Type"
public let CONTENT_TYPE_VALUE = "application/json"
public let AUTHORIZATION_KEY = "Authorization"
