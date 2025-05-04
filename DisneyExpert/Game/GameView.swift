//
//  GameView.swift
//  DisneyExpert
//
//  Created by Ольга on 20.04.25.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var viewModel: GameViewModel
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        HStack{
            VStack{
                ForEach(viewModel.characters){ character in
                    GameItemView(name: character.name, checked: viewModel.checkedCharacters.contains(character.id) || viewModel.currentCharacter == character.id).onTapGesture {
                        viewModel.onCharacterChecked(id: character.id)
                    }
                }
            }
            VStack{
                ForEach(viewModel.movies, id: \.self){ movie in
                    GameItemView(name: movie, checked: viewModel.checkedMovies.contains(movie) || viewModel.currentMovie == movie).onTapGesture {
                        viewModel.onMovieChecked(movie: movie)
                    }
                }
            }
        }
    }
}

#Preview {
    GameView()
}
