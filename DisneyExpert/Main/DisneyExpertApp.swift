//
//  DisneyExpertApp.swift
//  DisneyExpert
//
//  Created by Ольга on 20.04.25.
//

import SwiftUI
import SwiftData

@main
struct DisneyExpertApp: App {
    var body: some Scene {
        WindowGroup {
            @Environment(\.modelContext) var modelContext
            ContentView()
                .environmentObject(AppViewModel())
                .environmentObject(CharacterListViewModel(webRepository: DisneyWebRepository(mapper: CharacterWebMapper()), dataRepository: DisneyDataRepository(modelContext: modelContext, mapper: CharacterDBMapper())))
                .environmentObject(FavoritesViewModel())
                .environmentObject(GameViewModel())
        }
        .modelContainer(for: CharacterDB.self)
    }
}
