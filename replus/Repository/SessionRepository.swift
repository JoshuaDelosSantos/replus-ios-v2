//
//  SessionRepository.swift
//  replus
//
//  Created by Joshua Delos Santos on 3/1/2025.
//


import CoreData


class SessionRepository {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    /// Create a new Session.
    func createSession(id: UUID = UUID(), name: String) throws {
        let newSession = Session(context: context)
        newSession.id = id
        newSession.name = name
        
        try saveContext()
        }
    
    /// Save context changes.
    private func saveContext() throws {
        if context.hasChanges {
            try context.save()
        }
    }
}
