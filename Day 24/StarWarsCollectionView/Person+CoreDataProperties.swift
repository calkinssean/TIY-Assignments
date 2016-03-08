//
//  Person+CoreDataProperties.swift
//  StarWarsCollectionView
//
//  Created by Sean Calkins on 3/7/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var name: String?
    @NSManaged var created: NSDate?
    @NSManaged var gender: String?
    @NSManaged var vehicles: NSSet?

}
