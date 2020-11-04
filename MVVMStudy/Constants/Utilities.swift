//
//  Utilities.swift
//  MVVMStudy
//
//  Created by Nabeesath on 04/11/20.
//  Copyright © 2020 Nabeesath. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    
    static func showAlert(_ viewController: UIViewController, title: String, message: String, handler: ((UIAlertAction) -> Void)?) {
        
           let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
           alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: handler))
           viewController.present(alert, animated: true, completion: nil)
       }
    
}
