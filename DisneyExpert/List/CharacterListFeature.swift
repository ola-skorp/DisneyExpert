//
//  CharacterListFeature.swift
//  DisneyExpert
//
//  Created by Ольга on 03.05.25.
//

import ComposableArchitecture
import Foundation
import DomainModule
import DatabaseModule

@Reducer
struct CharacterListFeature {
    let getPageUC: IGetPageUC
    let dataRepository: IDisneyDataRepository

    @ObservableState
    struct State: Equatable {
        var list: [Character]
        var isLoading: Bool
        var page: Int
        var totalPages: Int
    }

    enum Action {
        case load
        case favorite(Character)
        case gotList([Character], Int)
        case onFaviriteChanged(Character)
        case loading
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .load:
            guard state.page <= state.totalPages else {
                return .none
            }
            guard !state.isLoading else { return .none }
            let page = state.page
            return .run { send in
                await send(.loading)
                let chars = await getPageUC.execute(page: page)
                await send(
                    .gotList(
                        chars?.characters ?? [],
                        chars?.totalPagesNumber ?? 1))
            }

        case let .favorite(character):
            return .run { send in
                if character.isFavorite {
                    await dataRepository.removeCharacter(
                        character: character)
                } else {
                    await dataRepository.saveCharacter(character: character)
                }
                await send(.onFaviriteChanged(character))
            }

        case let .gotList(chars, totalPagesNumber):
            state.list.append(contentsOf: chars)
            state.isLoading = false
            state.page += 1
            state.totalPages = totalPagesNumber
            return .none

        case .loading:
            state.isLoading = true
            return .none

        case let .onFaviriteChanged(char):
            var character = char
            character.isFavorite = !character.isFavorite
            let index = state.list.firstIndex { item in
                item.id == character.id
            }!
            state.list.remove(at: index)
            state.list.insert(character, at: index)
            return .none

        }
    }
}
