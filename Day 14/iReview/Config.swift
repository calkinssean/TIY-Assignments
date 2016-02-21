//
//  Config.swift
//  iReview
//
//  Created by Sean Calkins on 2/18/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String:AnyObject]
typealias JSONArray = [JSONDictionary]

class Config {
    
    static let sharedInstance = Config()
    private init() {}
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    let kHasLoggedIn = "kHasLoggedIn"
    let kUserName = "kUserName"
    
    
    var hasLoggedIn: Bool?
    var userName: String?
    
    
    
    
    
    
    func saveDefaults() {
        self.defaults.setBool(self.hasLoggedIn!, forKey: kHasLoggedIn)
        self.defaults.setValue(self.userName, forKey: kUserName)
        
    }
    
    func loadDefaults() {
        
        self.userName = defaults.stringForKey(kUserName)
        self.hasLoggedIn = defaults.boolForKey(kHasLoggedIn)
        
    }
    func printValues() {
        print(self.userName)
    }
    
    
    
    
    
}
