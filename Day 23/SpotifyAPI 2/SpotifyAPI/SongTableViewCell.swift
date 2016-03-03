//
//  SongTableViewCell.swift
//  SpotifyAPI
//
//  Created by Sean Calkins on 3/1/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var songNameLabel: UILabel!
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
