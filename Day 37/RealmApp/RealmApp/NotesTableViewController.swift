//
//  NotesTableViewController.swift
//  RealmApp
//
//  Created by Sean Calkins on 3/23/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit
import RealmSwift

class NotesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentUser = User()
    var arrayOfNotes = [Note]()
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for n in currentUser.notes {
            self.arrayOfNotes.append(n)
        }
        self.tableView.reloadData()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addTapped")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
       
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let n = arrayOfNotes[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("Note Cell", forIndexPath: indexPath)
        cell.textLabel?.text = n.noteDescription
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayOfNotes.count
        
    }
    
    
    func addTapped() {
        print("add tapped")
        let ac = UIAlertController(title: "Add", message: "Add a note", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default) {
            (alertAction) -> Void in
            let date = NSDate()
            
            let n  = Note()
            
            n.createdAt = date
            
            n.user = self.currentUser
            
            if let textField = ac.textFields?.first,
                
                let name = textField.text {
                    
                    n.noteDescription = name
                    
            }
            try! self.realm.write {
                self.currentUser.notes.append(n)
                self.realm.add(n)
                
            }

            self.arrayOfNotes.append(n)
            self.tableView.reloadData()
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) {
            (alertAction) -> Void in
            
        }
        
        ac.addTextFieldWithConfigurationHandler { (textField) -> Void in
            
        }
        
        ac.addAction(saveAction)
        
        ac.addAction(cancelAction)
        
        presentViewController(ac, animated: true, completion: nil)
    }
    
    @IBAction func editProfileTapped(sender: BorderButton) {
        performSegueWithIdentifier("editProfileSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editProfileSegue" {
            let controller = segue.destinationViewController as! EditProfileViewController
            controller.currentUser = self.currentUser
        }
    }
    
    @IBAction func searchByNameTapped(sender: BorderButton) {
        performSegueWithIdentifier("searchByNameSegue", sender: self)
    }
    
    @IBAction func searchByDateTapped(sender: BorderButton) {
        performSegueWithIdentifier("searchByDateSegue", sender: self)
    }
    
    @IBAction func unwindSegue (segue: UIStoryboardSegue) {}
    
}
