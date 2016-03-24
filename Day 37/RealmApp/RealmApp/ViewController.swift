//
//  ViewController.swift
//  RealmApp
//
//  Created by Sean Calkins on 3/23/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    let realm = try! Realm()
    
    var currentUser = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.usernameTextField.text = ""
        self.passwordTextField.text = ""
    }
    
    @IBAction func loginTapped(sender: UIButton) {
        
        let searchedUsers = realm.objects(User).filter("username == '\(usernameTextField.text!)'")
        
        var correctLogin = false
        
        for user in searchedUsers {
            
            if user.password == passwordTextField.text! {
             
                correctLogin = true
                self.currentUser = user
                
            }
        }
        
        if correctLogin == true {
            
            print("logged in")
            
            performSegueWithIdentifier("loggedInSegue", sender: self)
            
        } else {
            
            presentAlert("Incorrect username and password.")
            
        }
        
    }
    
    @IBAction func unwindSegue (segue: UIStoryboardSegue) {}
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "loggedInSegue" {
            let control = segue.destinationViewController as! NotesTableViewController
            control.currentUser = self.currentUser
        }
    }
    
    func presentAlert(alertMessage: String) {
        
        let alertController = UIAlertController(title: "Oops", message: "\(alertMessage)", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
        
        self.usernameTextField.text = ""
        self.passwordTextField.text = ""
        
    }
    
}

