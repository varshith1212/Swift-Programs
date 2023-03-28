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
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    
    let activityIndicatorView = UIActivityIndicatorView(style: .large)
    
    var country: String = "in"
    var type: String = "podcasts/top/50/podcasts"
    
    var results: [Results] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicatorView.frame = view.frame
        activityIndicatorView.hidesWhenStopped = true
               

        // Do any additional setup after loading the view.
        //getPodcasts()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Country", style: .plain, target: self, action: #selector(addTapped))
        getContent(country: country, type: type)
        
        navigationItem.title = "Podcasts"
    }
    
    @objc func addTapped() {
        
        
        let actionSheet = UIAlertController(title: "Select Country", message: "Select Country to differ content", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "India", style: .default, handler: { (action)->Void in
            self.country = "in"
            self.getContent(country: self.country, type: self.type)}))
        actionSheet.addAction(UIAlertAction(title: "USA", style: .default, handler: { (action)->Void in
            self.country = "us"
            self.getContent(country: self.country, type: self.type)}))
        actionSheet.addAction(UIAlertAction(title: "UK", style: .default, handler: { (action)->Void in
            self.country = "gb"
            self.getContent(country: self.country, type: self.type)}))
        actionSheet.addAction(UIAlertAction(title: "Switzerland", style: .default, handler: { (action)->Void in
            self.country = "ch"
            self.getContent(country: self.country, type: self.type)}))
        actionSheet.addAction(UIAlertAction(title: "Russia", style: .default, handler: { (action)->Void in
            self.country = "ru"
            self.getContent(country: self.country, type: self.type)}))
        actionSheet.addAction(UIAlertAction(title: "Japan", style: .default, handler: { (action)->Void in
            self.country = "jp"
            self.getContent(country: self.country, type: self.type)}))
        actionSheet.addAction(UIAlertAction(title: "Italy", style: .default, handler: { (action)->Void in
            self.country = "it"
            self.getContent(country: self.country, type: self.type)}))
        actionSheet.addAction(UIAlertAction(title: "Australia", style: .default, handler: { (action)->Void in
            self.country = "au"
            self.getContent(country: self.country, type: self.type)}))
        actionSheet.addAction(UIAlertAction(title: "Brazil", style: .default, handler: { (action)->Void in
            self.country = "br"
            self.getContent(country: self.country, type: self.type)}))
        actionSheet.addAction(UIAlertAction(title: "France", style: .default, handler: { (action)->Void in
            self.country =  "fr"
            self.getContent(country: self.country, type: self.type)}))
        actionSheet.addAction(UIAlertAction(title: "cancel", style: .destructive , handler: nil))
        self.present(actionSheet, animated: true)
        
        hideMenu()
        showActivityIndicator()
    }
    
    func getContent(country: String, type: String) {
        
        hideActivityIndicator()
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/" + country + "/" + type + ".json") else { return }
        
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

    var menuOut = false
    
    @IBAction func onMenuTapped(_ sender: Any) {
        if menuOut == false{
            leadingConstraint.constant = 250
            trailingConstraint.constant = -250
            menuOut = true
        }else{
            hideMenu()
        }
    }
    
    func hideMenu() {
        leadingConstraint.constant = 0
        trailingConstraint.constant = 0
        menuOut = false
    }
    
    @IBAction func onProfileTapped(_ sender: Any) {
        if let registerViewController = self.storyboard?.instantiateViewController(identifier: "RegisterViewControllerID") as? RegisterViewController {
            registerViewController.userNameText = UserDefaults.standard.string(forKey: "usernametextstore")
            
            self.navigationController?.pushViewController(registerViewController, animated: true)
        }
        hideMenu()
    }
    
    @IBAction func onPodcastTapped(_ sender: Any) {
        showActivityIndicator()
        self.type = "podcasts/top/50/podcasts"
        getContent(country: country, type: type)
        hideMenu()
        navigationItem.title = "Podcasts"
    }
    
    @IBAction func onAppsTapped(_ sender: Any) {
        showActivityIndicator()
        self.type = "apps/top-free/50/apps"
        getContent(country: country, type: type)
        hideMenu()
        navigationItem.title = "Apps"
    }
    
    @IBAction func onBooksTapped(_ sender: Any) {
        showActivityIndicator()
        self.type = "books/top-free/50/books"
        getContent(country: country, type: type)
        hideMenu()
        navigationItem.title = "Books"
    }
    
    @IBAction func onLogOuttapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "IsAppLoggedIn")
        self.navigationController?.popViewController(animated: true)
    }
    
    func showActivityIndicator() {
        self.view.addSubview(activityIndicatorView)
        self.activityIndicatorView.startAnimating()
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicatorView.stopAnimating()
        }
    }

}
