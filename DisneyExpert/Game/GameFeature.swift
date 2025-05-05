//
//  GameFeature.swift
//  DisneyExpert
//
//  Created by Ольга on 03.05.25.
//

import Foundation
import ComposableArchitecture
import DomainModule
import DatabaseModule

@Reducer
struct GameFeature {
    let dataRepo: IDisneyDataRepository
    @ObservableState
    struct State {
        var checkedCharacters: [Int] = []
        var checkedMovies: [Movie] = []
        var currentCharacter: Character? = nil
        var currentMovie: Movie? = nil
        var characters: [Character] = []
        var movies: [Movie] = []
    }
    
    enum Action {
        case load
        case onLoaded([Character])
        case characterClick(Character)
        case movieClick(Movie)
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .load:
            return .run { send in
                let chars = await Array(dataRepo.getAll().shuffled().prefix(10))
                await send(.onLoaded(chars))
            }
        case let .onLoaded(chars):
            state.checkedCharacters.removeAll()
            state.checkedMovies.removeAll()
            state.characters.removeAll()
            state.characters.append(contentsOf: chars)
            state.movies.removeAll()
            state.movies.append(contentsOf: chars.map({ character in
                Movie(id: UUID.init().uuidString, name: character.movie)
            }).shuffled())
            return .none
        case let .characterClick(char):
            if state.currentCharacter?.id == char.id {
                state.currentCharacter = nil
            } else {
                state.currentCharacter = char
            }
            if isPairReady(character: state.currentCharacter, movie: state.currentMovie){
                state.checkedCharacters.append(state.currentCharacter!.id)
                state.checkedMovies.append(state.currentMovie!)
            }
            if(state.currentCharacter != nil && state.currentMovie != nil){
                state.currentCharacter = nil
                state.currentMovie = nil
            }
            return .none
        case let .movieClick(movie):
            if state.currentMovie?.id == movie.id {
                state.currentMovie = nil
            } else {
                state.currentMovie = movie
            }
            if isPairReady(character: state.currentCharacter, movie: state.currentMovie){
                state.checkedCharacters.append(state.currentCharacter!.id)
                state.checkedMovies.append(state.currentMovie!)
            }
            if(state.currentCharacter != nil && state.currentMovie != nil){
                state.currentCharacter = nil
                state.currentMovie = nil
            }
            return .none
        }
    }
    
    private func isPairReady(character: Character?, movie: Movie?) -> Bool {
        return character != nil && movie != nil && character!.movie == movie!.name
    }
}
