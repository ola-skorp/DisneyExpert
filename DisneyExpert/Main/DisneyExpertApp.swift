//
//  DisneyExpertApp.swift
//  DisneyExpert
//
//  Created by Ольга on 20.04.25.
//

import ComposableArchitecture
import SwiftUI
import WebModule
import DatabaseModule

@main
struct DisneyExpertApp: App {
    @InjectedWeb
    private var webRepo: IDisneyWebRepository
    @InjectedDatabase
    private var dataRepo: IDisneyDataRepository
    
    var body: some Scene {
        WindowGroup {
            let listStore = Store(
                initialState: CharacterListFeature.State(
                    list: [], isLoading: false, page: 1, totalPages: 1),
                reducer: {
                    CharacterListFeature(
                        getPageUC: GetPageUC(
                            webRepo: webRepo,
                            dataRepo: dataRepo),
                        dataRepository: dataRepo)
                })
            let favoritesStore = Store(
                initialState: FavoritesFeature.State(list: []),
                reducer: {
                    FavoritesFeature(dataRepository: dataRepo)
                })
            let gameStore = Store(
                initialState: GameFeature.State(),
                reducer: {
                    GameFeature(dataRepo: dataRepo)
                })
            ContentView(listStore: listStore, favoritesStore: favoritesStore, gameStore: gameStore)
                .environmentObject(AppViewModel())
        }
    }
}
