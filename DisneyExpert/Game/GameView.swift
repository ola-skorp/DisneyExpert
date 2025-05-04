//
//  GameView.swift
//  DisneyExpert
//
//  Created by Ольга on 20.04.25.
//

import SwiftUI
import ComposableArchitecture

struct GameView: View {
    let store: StoreOf<GameFeature>
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        HStack{
            VStack{
                ForEach(store.characters){ character in
                    GameItemView(name: character.name, checked: store.checkedCharacters.contains(character.id) || store.currentCharacter?.id == character.id).onTapGesture {
                        store.send(.characterClick(character))
                    }
                }
            }
            VStack{
                ForEach(store.movies){ movie in
                    GameItemView(name: movie.name, checked: store.checkedMovies.contains(movie) || store.currentMovie?.id == movie.id).onTapGesture {
                        store.send(.movieClick(movie))
                    }
                }
            }
        }.onAppear {
            store.send(.load)
        }
    }
}
