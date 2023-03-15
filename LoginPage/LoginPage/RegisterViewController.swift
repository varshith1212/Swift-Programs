//
//  RegisterViewController.swift
//  LoginPage
//
//  Created by Sai Varshith on 14/03/23.
//  Copyright © 2023 Sai Varshith. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, PersonDetailsDelegate {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    var editViewController: EditViewController?
    
    var userNameText: String?
    var passwordText: String?
    var firstNameText: String?
    var lastNameText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userName.text = userNameText
        password.text = passwordText
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickEdit(_ sender: Any) {
        let viewController = self.storyboard?.instantiateViewController(identifier: "EditViewControllerID") as! EditViewController
        viewController.sendDelegate = self

        self.navigationController?.pushViewController(viewController, animated: true)        
    }
    
    func sendPersonDetails(firstnametext: String?, lastnametext: String?) {
        if let fName = firstnametext {
         firstName.text = fName
        }else {
            print("NO DATA RECEIVED FIRST NAME")
        }
        if let lName = lastnametext {
            lastName.text = lName
        } else {
            print("NO DATA RECEIVED LAST NAME")
        }
    }
    
}
