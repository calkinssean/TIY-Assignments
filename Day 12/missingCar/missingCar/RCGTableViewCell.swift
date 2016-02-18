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
        let redColorValue = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let greenColorValue = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let blueColorValue = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let color = UIColor(red: CGFloat(redColorValue), green: CGFloat(greenColorValue), blue: CGFloat(blueColorValue), alpha: 1.0)
        self.backgroundColor = color
        print(redColorValue)
        
        Config.sharedInstance.redColorValue = Float(redColorValue)
        Config.sharedInstance.greenColorValue = Float(greenColorValue)
        Config.sharedInstance.blueColorValue = Float(blueColorValue)
        Config.sharedInstance.alphaColorValue = 0.0
        
        Config.sharedInstance.saveConfiguration()
    
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func saveDefaults() {
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
