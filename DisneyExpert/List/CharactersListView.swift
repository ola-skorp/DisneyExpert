//
//  CharactersListView.swift
//  DisneyExpert
//
//  Created by Ольга on 20.04.25.
//

import SwiftUI
import ComposableArchitecture

struct CharactersListView: View {
    let store: StoreOf<CharacterListFeature>
    var body: some View {
        List{
            ForEach(Array(store.list.enumerated()), id: \.element.id){ index, character in
                let isCharacterTheLast = (store.list.count - index) == 1
                VStack(alignment: HorizontalAlignment.leading){
                    Text("\(character.name) (\(character.movie))")
                    let image = if character.isFavorite { "star.fill" } else { "star" }
                    Image(systemName: image).padding(.vertical, 10).onTapGesture {
                        store.send(.favorite(character))
                    }
                }.onAppear {
                    if !store.isLoading && isCharacterTheLast {
                        store.send(.load)
                    }
                }.modifier(LoadingModifier(withLoading: store.isLoading && isCharacterTheLast))
            }
        }.onAppear{
            if store.list.isEmpty {
                store.send(.load)
            }
        }.animation(Animation.default, value: store.list.count)
    }
}
