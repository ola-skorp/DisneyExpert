//
//  DisneyDataRepository.swift
//  DisneyExpert
//
//  Created by Ольга on 04.05.25.
//

import Foundation
import Alamofire

protocol IDisneyWebRepository{
    func getCharacters(page: Int) async -> CharactersWithPageInfo?
}

class DisneyWebRepository: IDisneyWebRepository {
    init(mapper: CharacterWebMapper) {
        self.mapper = mapper
    }
    let mapper: CharacterWebMapper
    func getCharacters(page: Int) async -> CharactersWithPageInfo? {
        let response = await AF.request("https://api.disneyapi.dev/character?page=\(page)", interceptor: .retryPolicy)
                               // Caching customization.
                               .cacheResponse(using: .cache)
                               // Redirect customization.
                               .redirect(using: .follow)
                               // Validate response code and Content-Type.
                               .validate()
                               // Produce a cURL command for the request.
                               .cURLDescription { description in
                                 print(description)
                               }
                               // Automatic Decodable support with background parsing.
                               .serializingDecodable(PageWeb.self)
                               // Await the full response with metrics and a parsed body.
                               .response
        // Detailed response description for easy debugging.
        debugPrint(response)
        if let result = try? response.result.get() {
            let chars = result.data.map({ character in
                mapper.toDomain(web: character)
            })
            return CharactersWithPageInfo(characters: chars, totalPagesNumber: result.info.totalPages)
        } else {
            return nil
        }
    }
}
