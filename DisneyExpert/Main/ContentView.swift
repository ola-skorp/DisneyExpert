//
//  ContentView.swift
//  DisneyExpert
//
//  Created by Ольга on 20.04.25.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    let listStore: StoreOf<CharacterListFeature>
    let favoritesStore: StoreOf<FavoritesFeature>
    let gameStore: StoreOf<GameFeature>
    var body: some View {
        VStack{
            TabsView(listStore: listStore, favoritesStore: favoritesStore, gameStore: gameStore)
        }
        .fullScreenCover(isPresented: $viewModel.showOnboarding){
            OnboardingView()
        }
    }
}
