//
//  CharacterWeb.swift
//  DisneyExpert
//
//  Created by Ольга on 04.05.25.
//

import Foundation

struct CharacterWeb: Codable, Sendable {
    var _id: Int
    var name: String
    var films: [String]
    var shortFilms: [String]
    var tvShows: [String]
    var videoGames: [String]
}
