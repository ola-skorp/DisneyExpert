//
//  CharacterMapper.swift
//  DisneyExpert
//
//  Created by Ольга on 28.04.25.
//

import Foundation

class CharacterWebMapper{
    func toDomain(web: CharacterWeb) -> Character {
        return Character(id: web._id, name: web.name, movie: web.films.first ?? "")
    }
}
