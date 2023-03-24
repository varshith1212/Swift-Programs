//
//  ViewController.swift
//  imageURL
//
//  Created by Sai Varshith on 21/03/23.
//  Copyright © 2023 Sai Varshith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://cdn.cocoacasts.com/cc00ceb0c6bff0d536f25454d50223875d5c79f1/above-the-clouds.jpg")!
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url){
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
    }
}

