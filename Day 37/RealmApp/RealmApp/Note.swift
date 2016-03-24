//
//  Note.swift
//  RealmApp
//
//  Created by Sean Calkins on 3/23/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object {
    
    dynamic var noteDescription: String = ""
    dynamic var user: User?
    dynamic var createdAt: NSDate?
    dynamic var updatedAt: NSDate?
    
}