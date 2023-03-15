//
//  EditViewController.swift
//  LoginPage
//
//  Created by Sai Varshith on 14/03/23.
//  Copyright © 2023 Sai Varshith. All rights reserved.
//

import UIKit

protocol PersonDetailsDelegate: class {
    func sendPersonDetails(firstnametext: String?, lastnametext: String?)
}

class EditViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var save: UIButton!
        
    weak var sendDelegate: PersonDetailsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func onClickSave(_ sender: Any) {
        sendDelegate?.sendPersonDetails(firstnametext: firstName.text, lastnametext: lastName.text)
        self.navigationController?.popViewController(animated: true)
    }
    
}
