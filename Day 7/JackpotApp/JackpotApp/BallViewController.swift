//
//  ViewController.swift
//  JackpotApp
//
//  Created by Sean Calkins on 2/9/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit


class BallViewController: UIViewController {
    
    // MARK: - Variables
    
    var winningTicket: Ticket?
    var newTicket: Ticket?
    var imageViewText = ""
    
    @IBOutlet weak var ballLabel1: UILabel!
    @IBOutlet weak var ballLabel2: UILabel!
    @IBOutlet weak var ballLabel3: UILabel!
    @IBOutlet weak var ballLabel4: UILabel!
    @IBOutlet weak var ballLabel5: UILabel!
    @IBOutlet weak var ballLabel6: UILabel!
    
    
    @IBOutlet weak var tryAgainLabel: UILabel!
    @IBOutlet weak var checkForWinButton: UIButton!

    // MARK: - Change the text of theballs
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        ballLabel1.text = "\(newTicket!.number1)"
        ballLabel2.text = "\(newTicket!.number2)"
        ballLabel3.text = "\(newTicket!.number3)"
        ballLabel4.text = "\(newTicket!.number4)"
        ballLabel5.text = "\(newTicket!.number5)"
        ballLabel6.text = "\(newTicket!.number6)"
        }

    // MARK: - Check for winning ticket
    
    @IBAction func checkForWinButton(sender: UIButton) {
        print(winningTicket!.number1, winningTicket!.number2, winningTicket!.number3, winningTicket!.number4, winningTicket!.number5, winningTicket!.number6)
        if newTicket?.checkForWinningTicket(winningTicket!) == false {
            imageViewText = "sadBoiz"
        } else {
            imageViewText = "moneyBoiz"
        }
    }
    
    // MARK: - Changes image on final view controller to win/lose
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "winSlashLoseSegue" {
            let viewController = segue.destinationViewController as! winSlashLoseViewController
            viewController.imageViewText = "\(imageViewText)"
        }
    }
}

