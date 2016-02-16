//
//  TypeTwoTableViewCell.swift
//  starWarsApp
//
//  Created by Sean Calkins on 2/15/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class TypeTwoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var affiliationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.whiteColor()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
