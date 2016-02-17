//
//  RCGTableViewCell.swift
//  missingCar
//
//  Created by Sean Calkins on 2/16/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class RCGTableViewCell: UITableViewCell {

    
    @IBAction func garretButton(sender: UIButton) {
        let number1 = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let number2 = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let number3 = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let color = UIColor(red: CGFloat(number1), green: CGFloat(number2), blue: CGFloat(number3), alpha: 1.0)
        self.backgroundColor = color
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
