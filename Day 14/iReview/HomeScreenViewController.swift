//
//  HomeScreenViewController.swift
//  iReview
//
//  Created by Sean Calkins on 2/18/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
            
        Config.sharedInstance.loadDefaults()
        welcomeLabel.text = "Welcome to Plurch \(Config.sharedInstance.userName!)"
    }
    @IBAction func showRestaurantView(sender: UIButton) {
        
        performSegueWithIdentifier("showRestaurantTableViewSegue", sender: self)
        
    }
    @IBAction func showInfoView(sender: UIButton) {
        
        performSegueWithIdentifier("showInfoViewSegue", sender: self)
        
    }

   

}
