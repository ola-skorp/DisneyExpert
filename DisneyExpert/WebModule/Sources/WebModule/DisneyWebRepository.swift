//
//  DisneyDataRepository.swift
//  DisneyExpert
//
//  Created by Ольга on 04.05.25.
//

import Foundation
import Alamofire
import DomainModule

public protocol IDisneyWebRepository{
    func getCharacters(page: Int) async -> CharactersWithPageInfo?
}

class DisneyWebRepository: IDisneyWebRepository {
    @Injected
    private var mapper: CharacterWebMapper
    
    public func getCharacters(page: Int) async -> CharactersWithPageInfo? {
        let urlCache = URLCache(memoryCapacity: 20 * 1024 * 1024, diskCapacity: 200 * 1024 * 1024, diskPath: "cache")
        URLCache.shared = urlCache
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = URLCache.shared
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        let session = Session(configuration: configuration)
        let response = await session.request("https://api.disneyapi.dev/character?page=\(page)", interceptor: .retryPolicy)
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
