//
//  ViewController.swift
//  URLSessionExample
//
//  Created by Sai Varshith on 24/03/23.
//  Copyright © 2023 Sai Varshith. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var podcastTableView: UITableView!
       
    var results: [[String: Any]] = []
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getPodcasts()
    }

    func getPodcasts() {
        
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/podcasts/top/50/podcasts.json") else { return }
        
        let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "something went wrong")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                
                let artistsList  = ((json as? NSDictionary).value(forKey: "feed") as? NSDictionary).value(forKey: "results") as? NSArray
                
                self.results = artistsList as! [[String : Any]]
                        
                DispatchQueue.main.async {
                    self.podcastTableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = (results[indexPath.row] as? [String:Any])?["artistName"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let podcastViewController = self.storyboard?.instantiateViewController(identifier: "podcastViewControllerID") as? PodcastViewController {
            //data pass
            podcastViewController.artistDetails = results[indexPath.row]
            self.navigationController?.pushViewController(podcastViewController, animated: true)
        }
    }
}
