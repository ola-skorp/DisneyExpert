//
//  TabsView.swift
//  DisneyExpert
//
//  Created by Ольга on 30.04.25.
//

import SwiftUI
import ComposableArchitecture

struct TabsView: View {
    @EnvironmentObject var viewModel: AppViewModel
    let listStore: StoreOf<CharacterListFeature>
    let favoritesStore: StoreOf<FavoritesFeature>
    let gameStore: StoreOf<GameFeature>
    var body: some View {
        VStack {
            TabView(selection: $viewModel.currentTab){
                CharactersListView(store: listStore)
                    .tabItem{ Label("Characters", systemImage: "person.fill") }
                    .tag(TabType.list)
                
                FavoritesView(store: favoritesStore)
                    .tabItem{ Label("Favorites", systemImage: "star.fill") }
                    .tag(TabType.favorites)

                GameView(store: gameStore)
                    .tabItem{ Label("Game", systemImage: "gamecontroller.fill") }
                    .tag(TabType.game)
            }
        }.padding()
    }
}
