//
//  SessionListView.swift
//  replus
//
//  Created by Joshua Delos Santos on 3/1/2025.
//


import SwiftUI

struct SessionListView: View {
    @StateObject private var viewModel: SessionViewModel
    
    init(viewModel: SessionViewModel) {
            _viewModel = StateObject(wrappedValue: viewModel)
        }

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.sessions.isEmpty {
                    Text("No sessions available.")
                        .foregroundColor(.gray)
                } else {
                    List(viewModel.sessions, id: \.id) { session in
                        Text(session.name ?? "Unnamed Session")
                    }
                }
            }
            .navigationTitle("Sessions")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAddSessionSheet() }) {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
            .onAppear {
                viewModel.fetchSessions()
            }
        }
    }

    private func showAddSessionSheet() {
        // Placeholder for sheet logic
        // Could show a view for adding a new session
    }
}


struct SessionListView_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.preview
        let viewModel = SessionViewModel(context: persistenceController.container.viewContext)
        return SessionListView(viewModel: viewModel)
    }
}
