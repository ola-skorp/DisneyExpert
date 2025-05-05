//
//  DisneyExpertApp.swift
//  DisneyExpert
//
//  Created by Ольга on 20.04.25.
//

import ComposableArchitecture
import SwiftUI
import WebModule

@main
struct DisneyExpertApp: App {
    @InjectedWeb
    private var webRepo: IDisneyWebRepository
    
    var body: some Scene {
        WindowGroup {
            let listStore = Store(
                initialState: CharacterListFeature.State(
                    list: [], isLoading: false, page: 1, totalPages: 1),
                reducer: {
                    CharacterListFeature(
                        getPageUC: GetPageUC(
                            webRepo: webRepo,
                            dataRepo: DisneyDataRepository(database: Database())),
                        dataRepository: DisneyDataRepository(database: Database()))
                })
            let favoritesStore = Store(
                initialState: FavoritesFeature.State(list: []),
                reducer: {
                    FavoritesFeature(
                        dataRepository: DisneyDataRepository(database: Database()))
                })
            let gameStore = Store(
                initialState: GameFeature.State(),
                reducer: {
                    GameFeature(
                        dataRepo: DisneyDataRepository(database: Database()))
                })
            let repoData = DisneyDataRepository(database: Database())
            ContentView(listStore: listStore, favoritesStore: favoritesStore, gameStore: gameStore)
                .environmentObject(AppViewModel())
        }
    }
}
