//
//  InfoWeb.swift
//  DisneyExpert
//
//  Created by Ольга on 04.05.25.
//

import Foundation

struct InfoWeb: Codable, Sendable {
    var totalPages: Int

    init(totalPages: Int) {
        self.totalPages = totalPages
    }
}
