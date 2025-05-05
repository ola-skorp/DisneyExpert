//
//  File.swift
//  Database
//
//  Created by Ольга on 05.05.25.
//

import Foundation
import Swinject

public final class DiContainerDatabase {
    nonisolated(unsafe) public static let shared = DiContainerDatabase()
    public let container: Container
    
    private init() {
        container = Container()

        container.register(IDisneyDataRepository.self) { _ in DisneyDataRepository() }
    }
}
