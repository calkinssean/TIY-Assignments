//
//  TicketTableTableViewController.swift
//  JackpotApp
//
//  Created by Sean Calkins on 2/9/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class TicketTableViewController: UITableViewController {
    
    //MARK: - Variables
    
    var currentTicket = Ticket()
    var ticketsArray = [Ticket]()
    var winningTicket = Ticket()
    
    //MARK: - Methods to update UI and tableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winningTicket.generateTicket()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
                return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticketsArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TicketCell", forIndexPath: indexPath) as! TicketTableViewCell
        let currentTicket = ticketsArray[indexPath.row]
        
        cell.number1.text = "\(currentTicket.number1)"
        cell.number2.text = "\(currentTicket.number2)"
        cell.number3.text = "\(currentTicket.number3)"
        cell.number4.text = "\(currentTicket.number4)"
        cell.number5.text = "\(currentTicket.number5)"
        cell.number6.text = "\(currentTicket.number6)"

        return cell
    }

    // MARK: - Action Methods
    
    @IBAction func addTicket(sender: UIBarButtonItem) {
        let newTicket = Ticket()
        newTicket.generateTicket()
        ticketsArray.insert(newTicket, atIndex: 0)
        self.tableView.reloadData()
        currentTicket = newTicket
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "viewControllerSegue" {
            let viewController = segue.destinationViewController as! BallViewController
            viewController.newTicket = currentTicket
            viewController.winningTicket = winningTicket
        }
        
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        currentTicket = ticketsArray[indexPath.row]
        self.performSegueWithIdentifier("viewControllerSegue", sender: self)
    }
   
}
