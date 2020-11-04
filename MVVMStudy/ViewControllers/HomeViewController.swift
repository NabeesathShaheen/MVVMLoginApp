//
//  HomeViewController.swift
//  MVVMStudy
//
//  Created by Nabeesath on 03/11/20.
//  Copyright © 2020 Nabeesath. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tokenLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.usernameLabel.text = user?.email
        self.tokenLabel.text = user?.token
    }
    
    @IBAction func didTapLogoutButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
