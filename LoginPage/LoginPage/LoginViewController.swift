//
//  LoginViewController.swift
//  LoginPage
//
//  Created by Sai Varshith on 14/03/23.
//  Copyright © 2023 Sai Varshith. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func onClickLogin(_ sender: Any) {
        let registerViewController = self.storyboard?.instantiateViewController(identifier: "RegisterViewControllerID") as! RegisterViewController
        registerViewController.userNameText = userName.text
        registerViewController.passwordText = password.text
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
}
