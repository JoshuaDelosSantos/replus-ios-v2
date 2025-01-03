//
//  SessionViewModel.swift
//  replus
//
//  Created by Joshua Delos Santos on 3/1/2025.
//


import SwiftUI
import CoreData


class SessionViewModel: ObservableObject {
    private let sessionRepository: SessionRepository
    private let context: NSManagedObjectContext

    @Published var sessions: [Session] = []  // Holds all sessions
    @Published var errorMessage: String?     // Error message to be shown in UI
    
    init(context: NSManagedObjectContext) {
        self.context = context
        self.sessionRepository = SessionRepository(context: context)
    }

    // Method to fetch all sessions from Core Data
    func fetchSessions() {
        do {
            sessions = try sessionRepository.getAllSessions()
        } catch {
            errorMessage = "Failed to fetch sessions: \(error.localizedDescription)"
        }
    }
    
    // Method to create a new session
    func addSession(name: String) {
        do {
            try sessionRepository.createSession(name: name)
            fetchSessions()  // Refresh the list of sessions after adding
        } catch {
            errorMessage = "Failed to add session: \(error.localizedDescription)"
        }
    }
}
