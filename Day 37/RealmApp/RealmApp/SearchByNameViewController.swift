//
//  SearchByNameViewController.swift
//  RealmApp
//
//  Created by Sean Calkins on 3/23/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit
import RealmSwift

class SearchByNameViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let realm = try! Realm()
    
    var arrayOfNotes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        arrayOfNotes = []
        self.tableView.reloadData()
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        print("text did change")
        if searchText != "" {
            self.arrayOfNotes = []
            self.tableView.reloadData()
            let searchedUsers = realm.objects(User).filter("username BEGINSWITH[c]'\(searchText)'")
            for user in searchedUsers {
                for n in user.notes {
                    self.arrayOfNotes.append(n)
                    self.tableView.reloadData()
                }
            }
        } else {
            arrayOfNotes = []
            self.tableView.reloadData()
        }
        
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        
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
    
}
