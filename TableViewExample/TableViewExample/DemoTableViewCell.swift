//
//  DemoTableViewCell.swift
//  TableViewExample
//
//  Created by Sai Varshith on 17/03/23.
//  Copyright © 2023 Sai Varshith. All rights reserved.
//

import UIKit

class DemoTableViewCell: UITableViewCell {

    @IBOutlet var country: UILabel!
    @IBOutlet var countryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        countryImage.layer.masksToBounds = true
        countryImage.layer.cornerRadius = countryImage.frame.height / 2
    }
    
}
