//
//  RestaurantTableViewCell.swift
//  iReview
//
//  Created by Sean Calkins on 2/18/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    @IBOutlet weak var restaurantImage: UIImageView!

    @IBOutlet weak var restaurantNameLabel: UILabel!
    
    @IBOutlet weak var restaurantAdressLabel: UILabel!
       
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
