//
//  PodcastViewController.swift
//  URLSessionExample
//
//  Created by Sai Varshith on 24/03/23.
//  Copyright © 2023 Sai Varshith. All rights reserved.
//

import UIKit

class PodcastViewController: UIViewController {

    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var podcastName: UILabel!
    @IBOutlet weak var urlImage: UIImageView!
    @IBOutlet weak var genre: UILabel!
    var artistDetails: [String: Any] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        artistName.text = (artistDetails as NSDictionary).value(forKey: "artistName") as? String
        podcastName.text = (artistDetails as NSDictionary).value(forKey: "name") as? String
        genre.text = (((artistDetails as NSDictionary).value(forKey: "genres") as? NSArray)?[0] as! NSDictionary).value(forKey: "name") as? String
        
        let url = URL(string: (artistDetails as NSDictionary).value(forKey: "artworkUrl100") as! String)!
        let dataTask = URLSession.shared.dataTask(with: url){ (data, _, _) in
            if let data = data{
                DispatchQueue.main.async {
                    self.urlImage.image = UIImage(data: data)
                }
            }
        }
        dataTask.resume()
        
    }
    
   
}
