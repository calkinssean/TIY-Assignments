//
//  SearchByDateViewController.swift
//  RealmApp
//
//  Created by Sean Calkins on 3/23/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit
import RealmSwift

class SearchByDateViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startDateTextField: UITextField!
    
    @IBOutlet weak var endDateTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let realm = try! Realm()

    @IBAction func searchTapped(sender: BorderButton) {
    }
    

}
