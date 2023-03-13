//
//  ViewController.swift
//  LoginPage
//
//  Created by Sai Varshith on 13/03/23.
//  Copyright © 2023 Sai Varshith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainheader: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var passwod: UITextField!
    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onLogin(_ sender: Any) {
        mainheader.text = "You are now logged in!!!"
    }
}

