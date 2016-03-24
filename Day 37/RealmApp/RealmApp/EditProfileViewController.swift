//
//  EditProfileViewController.swift
//  RealmApp
//
//  Created by Sean Calkins on 3/23/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit
import RealmSwift

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    let realm = try! Realm()
    
    var currentUser = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func saveTapped(sender: UIButton) {
        if usernameTextField.text != "" {
            
            if usernameTextField.text == currentUser.username {
                
                if newPasswordTextField.text! == confirmPasswordTextField.text! {
                    
                    try! realm.write {
                        currentUser.password = newPasswordTextField.text!
                        realm.add(currentUser, update: true)
                    }
                    performSegueWithIdentifier("unwindFromEditProfile", sender: self)
                    
                } else {
                    presentAlert("Your passwords didn't match")
                }
            } else {
                presentAlert("Incorrect Username")
            }
        } else {
            presentAlert("Please enter your username")
        }
    }
    
    func presentAlert(alertMessage: String) {
        
        let alertController = UIAlertController(title: "Oops", message: "\(alertMessage)", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
        
        self.usernameTextField.text = ""
        self.newPasswordTextField.text = ""
        self.confirmPasswordTextField.text = ""
        
    }
    
}
