//
//  Device+CoreDataProperties.swift
//  CoreDataExample
//

//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Device {

    @NSManaged var name: String?
    @NSManaged var deviceType: String?

}
