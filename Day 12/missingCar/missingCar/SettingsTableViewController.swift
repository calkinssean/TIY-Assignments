//
//  SettingsTableViewController.swift
//  missingCar
//
//  Created by Sean Calkins on 2/16/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        headerView.backgroundColor = UIColor.clearColor()
        self.tableView.tableHeaderView = headerView
        
        
    }
    
    
        
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellOne", forIndexPath: indexPath) as! ColorChangeTableViewCell
        
        return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("CellTwo", forIndexPath: indexPath) as! RCGTableViewCell
            return cell
        }
    }
    
    
}
