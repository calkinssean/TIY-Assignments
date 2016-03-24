//
//  NewProfileViewController.swift
//  RealmApp
//
//  Created by Sean Calkins on 3/23/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit
import RealmSwift

class NewProfileViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    let realm = try! Realm()
    
    var formatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.dateFormat = "MMM/dd/yyyy HH:MM:ss"
        
    }
    
    //MARK: - Sign Up Button
    
    @IBAction func signUpTapped(sender: UIButton) {
        
        //Check to see if usernameTextField.text has a value
        
        if usernameTextField.text != "" {
            
            let searchedUsers = realm.objects(User)
            print(searchedUsers.count)
            var usernameDoesExist = false
            
            //Loops through users to see if potential username exists
            
            for searchedUser in searchedUsers {
                
                if usernameTextField.text == searchedUser.username {
                    usernameDoesExist = true
                }
                
            }
            
            //If username does not exist, do this
            
            if usernameDoesExist == false {
                
                //Check if passwords match & that passwordTextField has a value
                
                if passwordTextField.text == confirmPasswordTextField.text && passwordTextField.text != "" {
                    
                    //Creates a user object with properties and stores it
                    
                    let user = User()
                    
                    let date = NSDate()
                    
                    let userIdString = Int(date.timeIntervalSince1970)
                    
                    user.userId = userIdString
                    
                    user.username = "\(usernameTextField.text!)"
                    
                    user.password = "\(passwordTextField.text!)"
                    
                    user.createdAt = date
                    
                    try! realm.write {
                        realm.add(user)
                    }
                    
                    performSegueWithIdentifier("dismissNewProfileSegue", sender: self)
                    
                } else {
                    presentAlert("Your passwords didn't match")
                }
            } else {
                presentAlert("That username is taken.")
            }
        } else {
            presentAlert("Please type a username.")
        }
        
    }
    
    //MARK: - Alert Message
    
    func presentAlert(alertMessage: String) {
        
        let alertController = UIAlertController(title: "Oops", message: "\(alertMessage)", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
        
        self.usernameTextField.text = ""
        self.passwordTextField.text = ""
        self.confirmPasswordTextField.text = ""
        
    }
    
}
