//
//  CharactersListView.swift
//  DisneyExpert
//
//  Created by Ольга on 20.04.25.
//

import SwiftUI

struct CharactersListView: View {
    @EnvironmentObject var viewModel: CharacterListViewModel
    var body: some View {
        List{
            ForEach(viewModel.list){ character in
                VStack(alignment: HorizontalAlignment.leading){
                    Text(character.name)
                    let image = if character.isFavorite { "star.fill" } else { "star" }
                    Image(systemName: image).padding(.vertical, 10).onTapGesture {
                        viewModel.onFavorite(character: character)
                    }
                }
            }
        }
    }
}

#Preview {
    CharactersListView()
}
