//
//  FavoritesFeature.swift
//  DisneyExpert
//
//  Created by Ольга on 03.05.25.
//

import Foundation
import ComposableArchitecture
import DomainModule

@Reducer
struct FavoritesFeature{
    let dataRepository: IDisneyDataRepository
    
    @ObservableState
    struct State{
        var list: [Character]
    }
    
    enum Action{
        case load
        case onLoaded([Character])
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .load:
            return .run{ send in
                let chars = await dataRepository.getAll()
                await send(Action.onLoaded(chars))
            }
        case let .onLoaded(characters):
            state.list = characters
            return .none
        }
    }
}
