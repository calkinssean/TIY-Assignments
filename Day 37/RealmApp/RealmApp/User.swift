//
//  User.swift
//  RealmApp
//
//  Created by Sean Calkins on 3/23/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    
    dynamic var username: String = ""
    dynamic var password: String = ""
    dynamic var createdAt: NSDate?
    dynamic var updatedAt: NSDate?
    dynamic var userId: Int = 0
    
    let notes = List<Note>()
    
    override static func primaryKey() -> String? {
        return "userId"
    }
    
}