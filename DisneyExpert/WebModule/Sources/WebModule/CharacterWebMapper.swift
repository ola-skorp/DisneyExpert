//
//  CharacterWebMapper.swift
//  DisneyExpert
//
//  Created by Ольга on 04.05.25.
//

import Foundation
import DomainModule

class CharacterWebMapper {
    func toDomain(web: CharacterWeb) -> Character {
        return Character(id: web._id, name: web.name, movie: web.films.first ?? web.shortFilms.first ?? web.tvShows.first ?? web.videoGames.first ?? "", isFavorite: false)
    }
}
