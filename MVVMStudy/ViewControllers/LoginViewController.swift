//
//  ViewController.swift
//  MVVMStudy
//
//  Created by Nabeesath on 02/11/20.
//  Copyright © 2020 Nabeesath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loginUserViewModel: LoginUserViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bindViewModel() {
        self.loginUserViewModel.messageObserver = { [unowned self] title, message in
            Utilities.showAlert(self, title: title, message: message, handler: nil)
        }
        
        self.loginUserViewModel.successLoginObserver = { [unowned self] user in
            self.clearFields()
            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            homeVC.user = user
            self.navigationController!.pushViewController(homeVC, animated: true)
        }
    }
    
    func clearFields() {
        self.emailTextField.text = nil
        self.passwordTextField.text = nil
    }
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        let user = User(email: emailTextField.text!, password: passwordTextField.text!, token: "")
        loginUserViewModel = LoginUserViewModel(user: user)
        bindViewModel()
        self.loginUserViewModel.loginButtonClicked()
    }

}
