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
       
    var results: [Results] = []
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getPodcasts()
    }

    func getPodcasts() {
        
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/in/podcasts/top/50/podcasts.json") else { return }
        
        let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "something went wrong")
                return
            }
            
            let decoder = try! JSONDecoder().decode(Podcasts.self, from: dataResponse)
            // remove and add
            self.results = decoder.feed.results
        
            DispatchQueue.main.async {
                self.podcastTableView.reloadData()
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
        if let podcastViewController = self.storyboard?.instantiateViewController(identifier: "podcastViewControllerID") as? PodcastViewController {
            //data pass
            podcastViewController.artistDetails = results[indexPath.row]
            self.navigationController?.pushViewController(podcastViewController, animated: true)
        }
    }
}
