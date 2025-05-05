//
//  GetPageUC.swift
//  DisneyExpert
//
//  Created by Ольга on 29.04.25.
//

import Foundation
import WebModule
import DomainModule

protocol IGetPageUC{
    func execute(page: Int) async -> CharactersWithPageInfo?
}

class GetPageUC: IGetPageUC{
    let webRepo: IDisneyWebRepository
    let dataRepo: IDisneyDataRepository
    
    init(webRepo: IDisneyWebRepository, dataRepo: IDisneyDataRepository) {
        self.webRepo = webRepo
        self.dataRepo = dataRepo
    }
    
    func execute(page: Int) async -> CharactersWithPageInfo? {
        let result = await webRepo.getCharacters(page: page)
        
        if var chars = result?.characters.filter({ character in
            !character.movie.isEmpty
        }){
            let dbChars = await dataRepo.getAll()
            for index in 0..<chars.count {
                let current = chars[index]
                if dbChars.contains(where: { dbChar in dbChar.id == current.id}) {
                    chars[index].isFavorite = true
                }
            }
            return CharactersWithPageInfo(characters: chars, totalPagesNumber: result!.totalPagesNumber)
        } else {
            return nil
        }
    }
}
