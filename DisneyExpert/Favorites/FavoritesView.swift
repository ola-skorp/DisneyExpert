//
//  FavoritesView.swift
//  DisneyExpert
//
//  Created by Ольга on 20.04.25.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var viewModel: FavoritesViewModel
    var body: some View {
        List{
            ForEach(viewModel.list){ character in
                Text(character.name)
            }
        }
    }
}

#Preview {
    FavoritesView()
}
