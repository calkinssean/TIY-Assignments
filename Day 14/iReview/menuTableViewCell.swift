//
//  menuTableViewCell.swift
//  iReview
//
//  Created by Sean Calkins on 2/18/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class menuTableViewCell: UITableViewCell {

    var rating: Int = 0
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var dishPriceLabel: UILabel!
    
    @IBOutlet weak var star1Outlet: UIImageView!
    @IBOutlet weak var star2Outlet: UIImageView!
    @IBOutlet weak var star3Outlet: UIImageView!
    @IBOutlet weak var star4Outlet: UIImageView!
    @IBOutlet weak var star5Outlet: UIImageView!
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
