//
//  DataRepository.swift
//  DisneyExpert
//
//  Created by Ольга on 28.04.25.
//

import Foundation
import SwiftData

protocol IDisneyDataRepository {
    func saveCharacter(character: Character) async
    func removeCharacter(character: Character) async
}

class DisneyDataRepository: IDisneyDataRepository {
    let mapper: CharacterDBMapper
    let modelContext: ModelContext
    
    init(modelContext: ModelContext, mapper: CharacterDBMapper) {
        self.modelContext = modelContext
        self.mapper = mapper
    }
    
    func saveCharacter(character: Character) async {
        let db = mapper.toDB(character: character)
        modelContext.insert(db)
    }
    
    func removeCharacter(character: Character) async {
        let db = mapper.toDB(character: character)
        modelContext.delete(db)
    }
}
