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
    
    /// Read all Sessions from database.
    func getAllSessions() throws -> [Session] {
            let fetchRequest: NSFetchRequest<Session> = Session.fetchRequest()
            
            do {
                let sessions = try context.fetch(fetchRequest)
                return sessions
            } catch {
                // TODO: Check if there is a better way to hadle errors here.
                throw error
            }
        }
    
    /// Save context changes.
    private func saveContext() throws {
        if context.hasChanges {
            try context.save()
        }
    }
}
