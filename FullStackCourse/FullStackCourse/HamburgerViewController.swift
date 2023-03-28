//
//  HamburgerViewController.swift
//  FullStackCourse
//
//  Created by Sai Varshith on 27/03/23.
//  Copyright © 2023 Sai Varshith. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

    @IBOutlet var mainBackground: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func profileTapped(_ sender: UIButton) {
        if let profileViewController = self.storyboard?.instantiateViewController(identifier: "ProfileViewControllerID") as? ProfileViewController {
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    }

}
