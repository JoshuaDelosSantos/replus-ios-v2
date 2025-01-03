//
//  Session+CoreDataProperties.swift
//  replus
//
//  Created by Joshua Delos Santos on 3/1/2025.
//
//

import Foundation
import CoreData


extension Session {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Session> {
        return NSFetchRequest<Session>(entityName: "Session")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?

}

extension Session : Identifiable {

}
