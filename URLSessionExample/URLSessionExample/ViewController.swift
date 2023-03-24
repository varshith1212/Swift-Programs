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
    
    var podcasts: Podcasts.Feed! = nil
       
    var names:[String] = []
 
    
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
                   // print("Received Response:", json as Any)

                    let artistsList  = ((json as! NSDictionary).value(forKey: "feed") as! NSDictionary).value(forKey: "results") as! NSArray

                    for arist in artistsList {
                        
                        if let artistInfo = arist as? NSDictionary {
                            if let artistName = artistInfo.value(forKey: "artistName") as? String {
                                print("Artist Name :", artistName)
                                self.names.append(artistName)
                            }
                        }
                    }
                    DispatchQueue.main.async {
                        self.podcastTableView.reloadData()
                    }

                } catch {
                    print(error)
                }
            
//            do {
//                let decoder = JSONDecoder()
//                let podcast = try decoder.decode(Podcasts.Feed.self, from: dataResponse)
//                print("Podcasr", podcast.results)
//                self.podcasts = podcast
//            } catch let parsingError {
//                print(parsingError)
//            }
        }
        
        task.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = names[indexPath.row]//podcasts.results[indexPath.row].artistName
        return cell
    }
}

