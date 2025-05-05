//
//  Movie.swift
//  DisneyExpert
//
//  Created by Ольга on 29.04.25.
//

import Foundation

public struct Movie: Identifiable, Equatable{
    public var id: String
    public var name: String
    
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
