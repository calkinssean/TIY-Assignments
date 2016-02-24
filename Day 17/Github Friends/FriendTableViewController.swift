//
//  FriendsViewController.swift
//  Github Friends
//
//  Created by Sean Calkins on 2/23/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit
protocol GithubFriendsProtocol {
    func passFriend(friend: Friend)
}
class FriendTableViewController: UITableViewController, GithubFriendsProtocol {
    
    var friendsArray = [Friend]()
    
    var apiClient: APIController?
    
    var currentFriend: Friend?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiClient = APIController(delegate: self)
        self.apiClient?.searchForUser("calkinssean")
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "FriendCell")
        print(friendsArray.count)
        for friend in friendsArray {
            print("printing friends in friendsArray")
            print(friend.name)
        }
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let friend = friendsArray[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath)
        cell.textLabel?.text = friend.name
        print(friend.name)
        return cell
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(friendsArray.count)
        return friendsArray.count
    }
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        self.currentFriend = friendsArray[indexPath.row]
        performSegueWithIdentifier("showDetailViewSegue", sender: self)
    }
    func passFriend(friend: Friend) {
        debugPrint("pass friend called from view controller")
        self.friendsArray.append(friend)
        print(friend.name)
        print(friendsArray.count)
        self.tableView.reloadData()
    }
}


