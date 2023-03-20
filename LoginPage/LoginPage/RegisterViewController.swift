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
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var dateOfBirth: UILabel!
    
    var editViewController: EditViewController?
    
    var userNameText: String?
    var firstNameText: String?
    var lastNameText: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userName.text = userNameText
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(addTapped))
        
        firstName.text = UserDefaults.standard.string(forKey: "firstnametextstore")
        lastName.text = UserDefaults.standard.string(forKey: "lastnametextstore")
        dateOfBirth.text = UserDefaults.standard.string(forKey: "dateofbirthtextstore")
        
    }
    
    @objc func addTapped() {
        UserDefaults.standard.set(false, forKey: "IsAppLoggedIn")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickEdit(_ sender: Any) {
        let viewController = self.storyboard?.instantiateViewController(identifier: "EditViewControllerID") as! EditViewController
        viewController.sendDelegate = self

        self.navigationController?.pushViewController(viewController, animated: true)        
    }
    
    func sendPersonDetails(firstnametext: String?, lastnametext: String?, dateofbirthtext: String?) {
        firstName.text = firstnametext
        lastName.text = lastnametext
        dateOfBirth.text = dateofbirthtext
        
    }
    
}
