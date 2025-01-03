//
//  replusApp.swift
//  replus
//
//  Created by Joshua Delos Santos on 3/1/2025.
//

import SwiftUI

@main
struct replusApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
