//
//  PageWeb.swift
//  DisneyExpert
//
//  Created by Ольга on 04.05.25.
//

import Foundation

struct PageWeb: Decodable, Sendable {
    var info: InfoWeb
    var data: [CharacterWeb]
    
    init(info: InfoWeb, data: [CharacterWeb]) {
        self.info = info
        self.data = data
    }
}
