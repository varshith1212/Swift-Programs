//
//  EditViewController.swift
//  LoginPage
//
//  Created by Sai Varshith on 14/03/23.
//  Copyright © 2023 Sai Varshith. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setDatePickerAsInputViewFor(target: Any, selector: Selector) {
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0.0, y:0.0, width: screenWidth, height: 200.0))
        datePicker.datePickerMode = .date
        self.inputView = datePicker
        
        let toolbar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 40.0))
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(tapCancel))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Done", style: .done, target: nil, action: selector)
        toolbar.setItems([cancel, flexibleSpace, done], animated: false)
        self.inputAccessoryView = toolbar
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
}

protocol PersonDetailsDelegate: class {
    func sendPersonDetails(firstnametext: String?, lastnametext: String?, dateofbirthtext: String?)
}

class EditViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
        
    weak var sendDelegate: PersonDetailsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        self.dateOfBirth.setDatePickerAsInputViewFor(target: self, selector: #selector(dateSelected))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        sendDelegate?.sendPersonDetails(firstnametext: firstName.text, lastnametext: lastName.text, dateofbirthtext: dateOfBirth.text)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func dateSelected() {
        if let datePicker = self.dateOfBirth.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            self.dateOfBirth.text = dateFormatter.string(from: datePicker.date)
        }
        self.dateOfBirth.resignFirstResponder()
    }
    
}
