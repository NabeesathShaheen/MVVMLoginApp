//
//  LoginUserModel.swift
//  MVVMStudy
//
//  Created by Nabeesath on 03/11/20.
//  Copyright © 2020 Nabeesath. All rights reserved.
//

import UIKit

struct User {
    var email: String
    var password: String
    var token: String
}

enum ValidationError: Error {
    case emptyUsername
    case emptyPassword
    case invalidEmailAddress
    
    var localizedDescription: String {
        
        switch self {
        case .emptyUsername:
            return "Please enter the username"
        case .emptyPassword:
            return "Please enter the password"
        case .invalidEmailAddress:
            return "Please enter a valid email address"
        }
    }
}

class LoginUserViewModel {
    
    var email: String!
    var password: String!
    
    var messageObserver: ((_ title: String, _ message: String) -> Void)?
    var successLoginObserver: ((_ user: User) -> Void)?
    
    private var user: User?
    
    init(user: User?) {
        self.user = user
        
        if let user = user {
            self.setUserModel(user)
        }
    }
    
    func setUserModel(_ user: User) {
        email = user.email
        password = user.password
    }
    
    func validateInput(email: String, password: String) -> ValidationError? {
       
        if email.isEmpty {
            return .emptyUsername
            
        } else if password.isEmpty {
            return .emptyPassword
            
        } else if !validate(email: email){
            return .invalidEmailAddress
        }
        
        return nil
    }
    
    func validate(email: String) -> Bool {
        let regex = "([\\w-+]+(?:\\.[\\w-+]+)*@(?:[\\w-]+\\.)+[a-zA-Z]{2,7})"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return emailTest.evaluate(with: email)
    }
    
    func loginButtonClicked() {
        if let error = self.validateInput(email: self.email ?? "", password: self.password ?? "") {
            self.messageObserver?("Validation Error", error.localizedDescription)
        } else {
            callLoginApi()
        }
    }
    
    func callLoginApi() {
        let request = LoginApiRequest()
        request.email = self.user?.email
        request.password = self.user?.password
        ApiManager.loginApi(requestData: request) { (response, error)  in
            if error == nil {
                if let data = response as? LoginApiResponse {
                    let token = data.token ?? ""
                    if token.isEmpty {
                        self.messageObserver?("API Error", data.message ?? "")
                    } else {
                        self.user?.token = token
                        self.successLoginObserver?(self.user!)
                    }
                }
            } else {
                self.messageObserver?("API Error", (error?.message)!)
            }
        }
    }
}
