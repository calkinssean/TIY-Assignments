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
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        loadData()
        changeBackGroundColor()
        
    }
    
    @IBAction func saveButton(sender: UIButton) {
        saveData()
        changeBackGroundColor()
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func saveData() {
        
        Config.sharedInstance.name = self.nameTextField.text
        Config.sharedInstance.make = self.makeTextField.text
        Config.sharedInstance.model = self.modelTextField.text
        Config.sharedInstance.year = self.yearTextField.text
        Config.sharedInstance.license = self.licensePlateTextField.text
        
        Config.sharedInstance.saveConfiguration()
        
    }
    func loadData() {
        
        Config.sharedInstance.loadConfiguraton()
        
        self.nameTextField.text = Config.sharedInstance.name
        self.makeTextField.text = Config.sharedInstance.make
        self.modelTextField.text = Config.sharedInstance.model
        self.yearTextField.text = Config.sharedInstance.year
        self.licensePlateTextField.text = Config.sharedInstance.license
        
    }
    
    
    func changeBackGroundColor() {
        
        let color = UIColor(red: CGFloat(Config.sharedInstance.redColorValue), green: CGFloat(Config.sharedInstance.greenColorValue), blue: CGFloat(Config.sharedInstance.blueColorValue), alpha: CGFloat(1))
        self.view.backgroundColor = color
        
        
    }
    
    
}

