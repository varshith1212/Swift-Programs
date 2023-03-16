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
    
    
    var masterUserName: String = "Admin"
    var masterPassword: String = "admin123"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let value: Bool = UserDefaults.standard.bool(forKey: "IsAppLoggedIn")
        
        if value == true {
            openRegisterViewScreen()
        }
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        userName.text?.removeAll()
        password.text?.removeAll()
    }

    @IBAction func onClickLogin(_ sender: Any) {
        if userName.text == "" || password.text == "" {
            showAlertWithTitle("Enter credentials")
            userName.text?.removeAll()
            password.text?.removeAll()
        } else if userName.text != masterUserName {
            showAlertWithTitle("UserName Not Found")
            userName.text?.removeAll()
        } else if password.text != masterPassword {
            showAlertWithTitle("Password Not Matching")
            password.text?.removeAll()
        }else {
            DispatchQueue.main.async {
                UserDefaults.standard.set(true, forKey: "IsAppLoggedIn")
                self.openRegisterViewScreen()
            }
            
        }
        
    }
    
    func openRegisterViewScreen() {
        if let registerViewController = self.storyboard?.instantiateViewController(identifier: "RegisterViewControllerID") as? RegisterViewController {
            registerViewController.userNameText = masterUserName
            
            self.navigationController?.pushViewController(registerViewController, animated: true)
        }
    }
    
    
    func showAlertWithTitle(_ title: String, message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: false)
    }
    
}
