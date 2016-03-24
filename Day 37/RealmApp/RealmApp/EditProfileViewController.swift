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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let realm = try! Realm()
    
//    @IBAction func saveTapped(sender: UIButton) {
//        let ac = UIAlertController(title: "Add", message: "Add a note", preferredStyle: .Alert)
//        
//        let saveAction = UIAlertAction(title: "Save", style: .Default) {
//            (alertAction) -> Void in
//            let date = NSDate()
//            
//            let n  = Note()
//            
//            n.createdAt = date
//            
//            n.user = self.currentUser
//            
//            if let textField = ac.textFields?.first,
//                
//                let name = textField.text {
//                    
//                    n.noteDescription = name
//                    
//    }

}
