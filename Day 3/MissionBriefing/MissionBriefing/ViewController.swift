//
//  ViewController.swift
//  MissionBriefing
//
//  Created by Sean Calkins on 2/3/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
   
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var authenticationButton: UIButton!
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    @IBOutlet weak var TIYLogo: UIImageView!
    
    @IBOutlet weak var AuthenticateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == nameTextField {
        passwordTextField.becomeFirstResponder()
            
        }

        if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
        }
        
        return true
    }
    @IBAction func AuthenticateButton(sender: AnyObject) {
        var agentLastName = ""
        
        
        if let agentName = nameTextField.text {
        var otherName = agentName.componentsSeparatedByString(" ")
            if otherName.count > 1 {
                print(otherName[1])
                agentLastName = otherName[1]
                
            }
        }
        if passwordTextField.text == "Iron Yard" && nameTextField.text == "Sean Calkins" {
            greetingLabel.text = "Good evening, agent \(agentLastName)"
            self.view.backgroundColor = UIColor.greenColor()
            
        } else {
            greetingLabel.text = "Access Denied"
            self.view.backgroundColor = UIColor.redColor()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



// componentsSeparatedByString(" ")
