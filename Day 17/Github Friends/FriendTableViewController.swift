//
//  FriendsViewController.swift
//  Github Friends
//
//  Created by Sean Calkins on 2/23/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit
protocol GithubFriendsProtocol {
    func passFriendsArray(friendsArray: [Friend])
}
class FriendTableViewController: UITableViewController, GithubFriendsProtocol {
    
    var tableViewFriendArray = [Friend]()
    
    var apiClient: APIController?
    
    var currentFriend = Friend()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiClient = APIController(delegate: self)
        self.apiClient?.searchForUser("calkinssean")
        print(tableViewFriendArray.count)
        for friend in tableViewFriendArray {
            print("printing friends in friendsArray")
            print(friend.name)
        }
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let currentFriend = tableViewFriendArray[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath) as! FriendTableViewCell
        cell.friendNameLabel.text = currentFriend.name
        cell.friendLoginLabel.text = currentFriend.login
        
        print(currentFriend.name)
        return cell
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(tableViewFriendArray.count)
        return tableViewFriendArray.count
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.currentFriend = tableViewFriendArray[indexPath.row]
        performSegueWithIdentifier("showDetailViewSegue", sender: self)
        print(currentFriend.name)
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailViewSegue" {
                let detailViewController = segue.destinationViewController as! FriendDetailViewController
                detailViewController.detailFriend = self.currentFriend
            print(currentFriend.name)
        }
    }
    
    
    func passFriendsArray(friendsArray: [Friend]) {
        
        
        self.tableViewFriendArray = friendsArray

        
        dispatch_async(dispatch_get_main_queue(), {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        self.tableView.reloadData()
        })
        
        debugPrint("pass friend called from view controller")
                print(tableViewFriendArray.count)
        
    }
}


