//
//  DataRepository.swift
//  DisneyExpert
//
//  Created by Ольга on 28.04.25.
//

import Foundation
import SQLite3
import DomainModule

public protocol IDisneyDataRepository {
    func saveCharacter(character: Character) async
    func removeCharacter(character: Character) async
    func getAll() async -> [Character]
}

class DisneyDataRepository: IDisneyDataRepository {
    @Injected
    private var db: Database
    
    init(){
        self.db.openDatabase()
        self.db.createCharacterTable()
    }
    
    func saveCharacter(character: Character) async {
        db.insertCharacter(id: character.id, name: character.name, movie: character.movie)
    }
    
    func removeCharacter(character: Character) async {
        db.deleteCharacter(id: character.id)
    }
    
    func getAll() async -> [Character] {
        return db.getAllCharacters()
    }

}
