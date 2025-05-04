//
//  ContentView.swift
//  DisneyExpert
//
//  Created by Ольга on 20.04.25.
//

import SwiftUI

//https://api.disneyapi.dev/character
struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        VStack {
            TabView(selection: $viewModel.currentTab){
                CharactersListView()
                    .tabItem{ Label("Characters", systemImage: "person.fill") }
                    .tag(TabType.list)
                
                FavoritesView()
                    .tabItem{ Label("Favorites", systemImage: "star.fill") }
                    .tag(TabType.favorites)

                GameView()
                    .tabItem{ Label("Game", systemImage: "gamecontroller.fill") }
                    .tag(TabType.game)
            }
        }.padding()
    }
}

#Preview {
    ContentView()
}
