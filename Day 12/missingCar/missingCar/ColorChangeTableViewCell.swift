//
//  ColorChangeTableViewCell.swift
//  missingCar
//
//  Created by Sean Calkins on 2/16/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class ColorChangeTableViewCell: UITableViewCell {
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    var redColorValue: Float = 0.5
    var greenColorValue: Float = 0.5
    var blueColorValue: Float = 0.5
    var alphaValue: Float = 1
    
    @IBAction func valueChanged(sender: UISlider) {
        
        if sender == redSlider {
            self.redColorValue = sender.value
        } else if sender == greenSlider {
            self.greenColorValue = sender.value
        } else if sender == blueSlider {
            self.blueColorValue = sender.value
        }

        
        changeBackGroundColor()
        saveDefaults()
        
    }
    func changeBackGroundColor(){
        
        let color = UIColor(red: CGFloat(self.redColorValue), green: CGFloat(self.greenColorValue), blue: CGFloat(self.blueColorValue), alpha: CGFloat(1))
        self.backgroundColor = color
        
    }
    func saveDefaults() {
        
        Config.sharedInstance.redColorValue = self.redSlider.value
        Config.sharedInstance.greenColorValue = self.greenSlider.value
        Config.sharedInstance.blueColorValue = self.blueSlider.value
        
        Config.sharedInstance.saveConfiguration()
    }
    func loadDefaults() {
        
        Config.sharedInstance.loadConfiguraton()
        
        self.redColorValue = Config.sharedInstance.redColorValue
        self.greenColorValue = Config.sharedInstance.greenColorValue
        self.blueColorValue = Config.sharedInstance.blueColorValue
    
        self.redSlider.value = Config.sharedInstance.redColorValue
        self.greenSlider.value = Config.sharedInstance.greenColorValue
        self.blueSlider.value = Config.sharedInstance.blueColorValue
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        loadDefaults()
        changeBackGroundColor()
        
    }
}

