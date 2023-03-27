//
//  ContentViewController.swift
//  LoginPage
//
//  Created by Sai Varshith on 27/03/23.
//  Copyright © 2023 Sai Varshith. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var contentTableView: UITableView!
    @IBOutlet weak var displayName: UILabel!
    
    var results: [Results] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //getPodcasts()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Select Country", style: .plain, target: self, action: #selector(addTapped))
        
    }
    
    @objc func addTapped() {
        let actionSheet = UIAlertController(title: "Select Country", message: "Select Country to differ content", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "India", style: .default, handler: { (action)->Void in
            self.getPodcasts(country: "in")}))
        actionSheet.addAction(UIAlertAction(title: "USA", style: .default, handler: { (action)->Void in
        self.getPodcasts(country: "us")}))
        actionSheet.addAction(UIAlertAction(title: "UK", style: .default, handler: { (action)->Void in
        self.getPodcasts(country: "gb")}))
        actionSheet.addAction(UIAlertAction(title: "Switzerland", style: .default, handler: { (action)->Void in
        self.getPodcasts(country: "ch")}))
        actionSheet.addAction(UIAlertAction(title: "Russia", style: .default, handler: { (action)->Void in
        self.getPodcasts(country: "ru")}))
        actionSheet.addAction(UIAlertAction(title: "Japan", style: .default, handler: { (action)->Void in
        self.getPodcasts(country: "jp")}))
        actionSheet.addAction(UIAlertAction(title: "Italy", style: .default, handler: { (action)->Void in
        self.getPodcasts(country: "it")}))
        actionSheet.addAction(UIAlertAction(title: "Australia", style: .default, handler: { (action)->Void in
        self.getPodcasts(country: "au")}))
        actionSheet.addAction(UIAlertAction(title: "Brazil", style: .default, handler: { (action)->Void in
        self.getPodcasts(country: "br")}))
        actionSheet.addAction(UIAlertAction(title: "France", style: .default, handler: { (action)->Void in
        self.getPodcasts(country: "fr")}))
        actionSheet.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true)
    }
    
    func getPodcasts(country: String) {
        
        displayName.text = "Podcast"
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/" + country + "/podcasts/top/50/podcasts.json") else { return }
        
        let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "something went wrong")
                return
            }
            
            let decoder = try! JSONDecoder().decode(Podcasts.self, from: dataResponse)
            // remove and add
            self.results = decoder.feed.results
        
            DispatchQueue.main.async {
                self.contentTableView.reloadData()
            }
        }
        task.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = results[indexPath.row].artistName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let contentDetailsViewController = self.storyboard?.instantiateViewController(identifier: "contentDetailsViewControllerID") as? ContentDetailsViewController {
            //data pass
            contentDetailsViewController.artistDetails = results[indexPath.row]
            self.navigationController?.pushViewController(contentDetailsViewController, animated: true)
        }
    }

}
