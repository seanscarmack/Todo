//
//  Todo+CoreDataProperties.swift
//  Table View
//
//  Created by Sean Scarmack on 8/8/16.
//  Copyright © 2016 Sean Scarmack. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Todo {

    @NSManaged var completed: Bool
    @NSManaged var name: String?
    @NSManaged var note: String?
    @NSManaged var date: NSTimeInterval

}
