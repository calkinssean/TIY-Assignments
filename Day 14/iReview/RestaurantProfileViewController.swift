//
//  RestaurantProfileViewController.swift
//  iReview
//
//  Created by Sean Calkins on 2/18/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit


class RestaurantProfileViewController: UIViewController {
    var detailRestaurant: Restaurant?
    
    var menusArray = [Menu]()
    

    @IBOutlet weak var restaurantImageView: UIImageView!
    
    @IBOutlet weak var restaurantNameLabel: UILabel!
    
    @IBOutlet weak var restaurantDescriptionLabel: UILabel!
    
    @IBOutlet weak var restaurantAddressButton: UIButton!
    
    @IBAction func addressButtonTapped(sender: UIButton) {
        performSegueWithIdentifier("showMapViewSegue", sender: self)
    }
    @IBAction func menuButton(sender: BorderButton) {
        performSegueWithIdentifier("showMenuTableViewSegue", sender: self)
    }
    
    override func viewDidLoad() {
        print(detailRestaurant?.name)
        
        
        print(detailRestaurant?.menusArray)
        
        super.viewDidLoad()
        self.restaurantImageView.image = UIImage(named: "\(detailRestaurant!.imageName)")
        self.restaurantNameLabel.text = detailRestaurant?.name
        self.restaurantDescriptionLabel.text = detailRestaurant?.description
        self.restaurantAddressButton.setTitle(detailRestaurant?.location, forState: UIControlState .Normal)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMenuTableViewSegue" {
            let segueViewController = segue.destinationViewController as! MenuTableViewController
            segueViewController.menuRestaurant = detailRestaurant
        }
        if segue.identifier == "showMapViewSegue" {
            let segueViewController = segue.destinationViewController as! MapViewController
            segueViewController.currentRestaurant = detailRestaurant
        }
    }


}
