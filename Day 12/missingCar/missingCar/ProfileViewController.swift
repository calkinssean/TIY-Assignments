//
//  FirstViewController.swift
//  missingCar
//
//  Created by Sean Calkins on 2/16/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var licensePlateTextField: UITextField!
    
    var redColorValue: Float = 0.5
    var greenColorValue: Float = 0.5
    var blueColorValue: Float = 0.5
    var alphaValue: Float = 0.5
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
        changeBackGroundColor()

    }
    
    

    
    @IBAction func saveButton(sender: UIButton) {
        saveData()
        loadData()
        changeBackGroundColor()
        print("Red: \(self.redColorValue)")
        print("Green: \(self.greenColorValue)")
        print("Blue: \(self.blueColorValue)")
        print("Alpha: \(self.alphaValue)")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func saveData() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(self.nameTextField.text, forKey: "Name")
        defaults.setValue(self.makeTextField.text, forKey: "Make")
        defaults.setValue(self.yearTextField.text, forKey: "Year")
        defaults.setValue(self.modelTextField.text, forKey: "Model")
        defaults.setValue(self.licensePlateTextField.text, forKey: "License Plate")
        
        defaults.synchronize()
    }
    func loadData() {
        let defaults = NSUserDefaults.standardUserDefaults()
        self.nameTextField.text = defaults.valueForKey("Name") as? String
        self.makeTextField.text = defaults.valueForKey("Make") as? String
        self.yearTextField.text = defaults.valueForKey("Year") as? String
        self.modelTextField.text = defaults.valueForKey("Model") as? String
        self.licensePlateTextField.text = defaults.valueForKey("License Plate") as? String
        
        
        self.redColorValue = defaults.floatForKey("RedKey")
        self.greenColorValue = defaults.floatForKey("GreenKey")
        self.blueColorValue = defaults.floatForKey("BlueKey")
        self.alphaValue = defaults.floatForKey("AlphaKey")
        

        
    }
    func changeBackGroundColor(){
        
        let color = UIColor(red: CGFloat(self.redColorValue), green: CGFloat(self.greenColorValue), blue: CGFloat(self.blueColorValue), alpha: CGFloat(self.alphaValue))
        
        self.view.backgroundColor = color
        
    }


}

