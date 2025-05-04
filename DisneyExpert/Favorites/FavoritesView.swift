//
//  FavoritesView.swift
//  DisneyExpert
//
//  Created by Ольга on 20.04.25.
//

import SwiftUI
import ComposableArchitecture

struct FavoritesView: View {
    let store: StoreOf<FavoritesFeature>
    var body: some View {
        List{
            ForEach(store.list){ character in
                Text(character.name)
            }
        }.onAppear {
            store.send(.load)
        }
    }
}
