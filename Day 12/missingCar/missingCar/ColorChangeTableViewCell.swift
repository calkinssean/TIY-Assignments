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
    @IBOutlet weak var alphaSlider: UISlider!
    
    var redColorValue: Float = 0.5
    var greenColorValue: Float = 0.5
    var blueColorValue: Float = 0.5
    var alphaValue: Float = 0.5
    
    @IBAction func valueChanged(sender: UISlider) {
        
        if sender == redSlider {
            self.redColorValue = sender.value
        } else if sender == greenSlider {
            self.greenColorValue = sender.value
        } else if sender == blueSlider {
            self.blueColorValue = sender.value
        } else if sender == alphaSlider {
            self.alphaValue = sender.value
        }
        print("Red: \(self.redColorValue)")
        print("Green: \(self.greenColorValue)")
        print("Blue: \(self.blueColorValue)")
        print("Alpha: \(self.alphaValue)")
        
        changeBackGroundColor()
        saveDefaults()
        
    }
    func changeBackGroundColor(){
        
        let color = UIColor(red: CGFloat(self.redColorValue), green: CGFloat(self.greenColorValue), blue: CGFloat(self.blueColorValue), alpha: CGFloat(self.alphaValue))
        self.backgroundColor = color
        
    }
    func saveDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setFloat(self.redColorValue, forKey: "RedKey")
        defaults.setFloat(self.greenColorValue, forKey: "GreenKey")
        defaults.setFloat(self.blueColorValue, forKey: "BlueKey")
        defaults.setFloat(self.alphaValue, forKey: "AlphaKey")
        defaults.synchronize()
    
    }
    func loadDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        self.redColorValue = defaults.floatForKey("RedKey")
        self.greenColorValue = defaults.floatForKey("GreenKey")
        self.blueColorValue = defaults.floatForKey("BlueKey")
        self.alphaValue = defaults.floatForKey("AlphaKey")
        
        self.redSlider.value = self.redColorValue
        self.greenSlider.value = self.greenColorValue
        self.blueSlider.value = self.blueColorValue
        self.alphaSlider.value = self.alphaValue
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        loadDefaults()
        changeBackGroundColor()
        
    }
}

