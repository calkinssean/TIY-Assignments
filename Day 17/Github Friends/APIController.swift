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
    
    var friendArray = [Friend]()
    
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
                                let x = Friend()
                                x.name = "Berf Chorf"
                                x.login = "DrBurgerLips"
                                x.email = "hambergrBoy@media.com"
                                x.avatar_url = "http://www.globalmeatnews.com/var/plain_site/storage/images/publications/food-beverage-nutrition/globalmeatnews.com/industry-markets/argentine-uruguay-beef-range-strikes-a-chord-in-china/8898427-1-eng-GB/Argentine-Uruguay-beef-range-strikes-a-chord-in-China.jpg"
                                let y = Friend()
                                y.name = "Edward Cullen"
                                y.login = "VaMpYrZ4EvA"
                                y.email = "ImAVegetarianVampire@aol.com"
                                y.avatar_url = "http://images6.fanpop.com/image/photos/33600000/Edward-Cullen-edward-cullens-future-wives-33679489-960-955.jpg"
                                print(f.name)
                                self.friendArray.append(f)
                                self.friendArray.append(y)
                                self.friendArray.append(x)
                                self.delegate?.passFriendsArray(self.friendArray)
                                
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