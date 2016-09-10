//
//  ToDos+CoreDataProperties.swift
//  Working App
//
//  Created by John Wallis on 10/09/2016.
//  Copyright © 2016 John Wallis. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ToDos {

    @NSManaged var todoItem: String?
    @NSManaged var complete: NSNumber?
    @NSManaged var todoDescription: String?
    @NSManaged var dueDate: NSDate?

}
