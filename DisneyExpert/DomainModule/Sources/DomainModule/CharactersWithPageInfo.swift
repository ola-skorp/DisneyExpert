//
//  CharacterWithPageInfo.swift
//  DisneyExpert
//
//  Created by Ольга on 02.05.25.
//

import Foundation

public struct CharactersWithPageInfo{
    public var characters: [Character]
    public var totalPagesNumber: Int
    
    public init(characters: [Character], totalPagesNumber: Int) {
        self.characters = characters
        self.totalPagesNumber = totalPagesNumber
    }
}
