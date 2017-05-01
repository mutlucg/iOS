//
//  AirportTableViewCell.swift
//  hw6
//
//  Created by Mutlu Can Gurbuz on 30/03/17.
//  Copyright © 2017 Mutlu Can Gurbuz. All rights reserved.
//

import UIKit

class AirportTableViewCell: UITableViewCell {

    @IBOutlet weak var airportName: UILabel!
    
    @IBOutlet weak var airportCityName: UILabel!
    
    @IBOutlet weak var airportCode: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
