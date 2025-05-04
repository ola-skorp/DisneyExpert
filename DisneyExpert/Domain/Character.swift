//
//  Character.swift
//  DisneyExpert
//
//  Created by Ольга on 20.04.25.
//

import Foundation

struct Character: Equatable, Identifiable{
    var id: Int
    var name: String
    var movie: String
    var isFavorite: Bool = false
}
