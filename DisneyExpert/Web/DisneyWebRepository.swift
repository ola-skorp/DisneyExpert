//
//  DisneyDataRepository.swift
//  DisneyExpert
//
//  Created by Ольга on 04.05.25.
//

import Foundation
import Alamofire

protocol IDisneyWebRepository{
    func getAll() -> [Character]
}

class DisneyWebRepository: IDisneyWebRepository {
    func getAll() -> [Character] {
        
    }
}
