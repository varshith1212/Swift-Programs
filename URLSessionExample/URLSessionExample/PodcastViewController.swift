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
    var artistDetails: Results!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        artistName.text = artistDetails.artistName
        podcastName.text = artistDetails.name
        genre.text = artistDetails.genres[0].name
        
        guard let url = URL(string: artistDetails.artworkUrl100) else {return}
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
