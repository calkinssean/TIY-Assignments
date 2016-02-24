//
//  FriendDetailViewController.swift
//  Github Friends
//
//  Created by Sean Calkins on 2/24/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {
    var detailFriend = Friend()
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendLoginLabel: UILabel!
    @IBOutlet weak var friendImageView: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendNameLabel.text = detailFriend.name
        friendLoginLabel.text = detailFriend.login
        self.loadImageFromURL("\(detailFriend.avatar_url)")
        
    }
    func loadImageFromURL(urlString: String) {
        if urlString.isEmpty == false {
            
            dispatch_async(dispatch_get_main_queue(), {
                if let url = NSURL(string: urlString) {
                    if let data = NSData(contentsOfURL: url) {
                        self.friendImageView.image = UIImage(data: data)
                    }
                }
            })
        } else {
            debugPrint("invalid \(urlString)")
        }
    }
  

}
