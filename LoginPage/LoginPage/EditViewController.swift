//
//  EditViewController.swift
//  LoginPage
//
//  Created by Sai Varshith on 14/03/23.
//  Copyright © 2023 Sai Varshith. All rights reserved.
//

import UIKit

protocol PersonDetailsDelegate: class {
    func sendPersonDetails()
}

class EditViewController: UIViewController, PersonDetailsDelegate {

    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var Submit: UIButton!
    
    weak var sendDelegate: PersonDetailsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickSubmit(_ sender: Any) {
        //let viewController = self.storyboard?.instantiateViewController(identifier: "RegisterViewControllerID") as! RegisterViewController
        self.navigationController?.popViewController(animated: true)
    }
    
    func sendPersonDetails() {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
