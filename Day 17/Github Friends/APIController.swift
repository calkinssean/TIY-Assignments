//
//  APIController.swift
//  Github Friends
//
//  Created by Sean Calkins on 2/23/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import Foundation

class APIController {
    
    var delegate: GithubFriendsProtocol?
    
    init(delegate: FriendTableViewController) {
        self.delegate = delegate
    }
    
    func searchForUser(userSearched: String) {
        
        let baseUrl = "https://api.github.com/users/\(userSearched)"
        if let url = NSURL(string: baseUrl) {
            
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url, completionHandler: {(data, response, error) in
                if error != nil {
                    print("error, \(error)")
                } else {
                    print(data)
                    
                    if let data = data {
                        
                        do {
                            
                            if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONDictionary {
                                
                                let f = Friend(dict: dict)
                                print(f.name)
                                self.delegate?.passFriend(f)
                                
                            } else {
                                print("error with parsing the dictionary")
                            }
                            
                        } catch {
                            
                        }
                    }
                }
            })
            task.resume()
        }
    }
}