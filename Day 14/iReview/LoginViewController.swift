//
//  LoginViewController.swift
//  iReview
//
//  Created by Sean Calkins on 2/18/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    var didLogIn: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaults()
        if didLogIn == true {
            performSegueWithIdentifier("loggedInSegue", sender: self)
        }
        
    }
    
    @IBAction func loggedIn(sender: BorderButton) {
        
        if passwordTextField.text == "Iron Yard" && userNameTextField.text == "Sean Calkins" {
            didLogIn = true
            saveDefaults()
            performSegueWithIdentifier("loggedInSegue", sender: self)
        } else {
        }
        
     
        
}
    func loadDefaults() {
        Config.sharedInstance.loadDefaults()
        self.didLogIn = Config.sharedInstance.hasLoggedIn!
    }
    func saveDefaults() {
        Config.sharedInstance.hasLoggedIn = self.didLogIn
        Config.sharedInstance.userName = self.userNameTextField.text
        Config.sharedInstance.saveDefaults()
}
}
