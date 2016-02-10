//
//  TicketTableViewCell.swift
//  JackpotApp
//
//  Created by Sean Calkins on 2/9/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class TicketTableViewCell: UITableViewCell {
    
    
    // MARK: - Variables
    
    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var number3: UILabel!
    @IBOutlet weak var number4: UILabel!
    @IBOutlet weak var number5: UILabel!
    @IBOutlet weak var number6: UILabel!
    
    // MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
