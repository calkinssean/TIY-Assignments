//
//  MenuTableViewController.swift
//  iReview
//
//  Created by Sean Calkins on 2/18/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var menuRestaurant: Restaurant?
    var currentMenu: Menu?
    var dishesArray = [Dish]()
    var currentDish: Dish?
    
    // "showDishesDetailSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentMenu = menuRestaurant?.menusArray.first
        print(currentMenu?.menuName)
        for dish in (currentMenu?.menuItems)! {
            dishesArray.append(dish)
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishesArray.count
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.currentDish = dishesArray[indexPath.row]
performSegueWithIdentifier("showDishesDetailSegue", sender: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDishesDetailSegue" {
            let segueViewController = segue.destinationViewController as! DishesDetailViewController
            segueViewController.detailDish = currentDish
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let currentDish = self.dishesArray[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("menuCell") as! MenuTableViewCell
        cell.dishNameLabel.text = currentDish.name
        cell.dishPriceLabel.text = "$\(currentDish.price)"
        cell.imageView?.image = UIImage(named: (currentDish.image))
        
        if currentDish.rating == 1 {
            cell.star1Outlet.image = UIImage(named: "star")
        }
        if currentDish.rating == 2 {
            cell.star1Outlet.image = UIImage(named: "star")
            cell.star2Outlet.image = UIImage(named: "star")
        }
        if currentDish.rating == 3 {
            cell.star1Outlet.image = UIImage(named: "star")
            cell.star2Outlet.image = UIImage(named: "star")
            cell.star3Outlet.image = UIImage(named: "star")
        }
        if currentDish.rating == 4 {
            cell.star1Outlet.image = UIImage(named: "star")
            cell.star2Outlet.image = UIImage(named: "star")
            cell.star3Outlet.image = UIImage(named: "star")
            cell.star4Outlet.image = UIImage(named: "star")
        }
        if currentDish.rating == 5 {
            cell.star1Outlet.image = UIImage(named: "star")
            cell.star2Outlet.image = UIImage(named: "star")
            cell.star3Outlet.image = UIImage(named: "star")
            cell.star4Outlet.image = UIImage(named: "star")
            cell.star5Outlet.image = UIImage(named: "star")
        }
        
        return cell
    }
}





