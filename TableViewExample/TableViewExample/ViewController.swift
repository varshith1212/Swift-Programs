//
//  ViewController.swift
//  TableViewExample
//
//  Created by Sai Varshith on 17/03/23.
//  Copyright © 2023 Sai Varshith. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = ["India", "Australia", "England", "USA", "South Africa", "Srilanka", "Nepal", "Bhutan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*
        guard let url = URL(string: "link") else { return }
        
        let decoder = JSONDecoder()
        let countryinfo = try decoder.decode(, from: <#T##Data#>)
        */
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        cell.country.text = data[indexPath.row]
        //cell.countryImage.backgroundColor = .red
        cell.countryImage?.image = UIImage(named: cell.country.text!)
        return cell
    }
    

}

