//
//  Character.swift
//  DisneyExpert
//
//  Created by Ольга on 20.04.25.
//

import Foundation

public struct Character: Equatable, Identifiable{
    public var id: Int
    public var name: String
    public var movie: String
    public var isFavorite: Bool
    
    public init(id: Int, name: String, movie: String, isFavorite: Bool) {
        self.id = id
        self.name = name
        self.movie = movie
        self.isFavorite = isFavorite
    }
}
