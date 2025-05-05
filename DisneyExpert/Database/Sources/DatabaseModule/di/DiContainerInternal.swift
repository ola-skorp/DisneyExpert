//
//  File.swift
//  Database
//
//  Created by Ольга on 05.05.25.
//

import Foundation
import Swinject

final class DiContainerInternal{
    nonisolated(unsafe) public static let shared = DiContainerInternal()
    public let container: Container
    
    private init() {
        container = Container()

        container.register(Database.self) { _ in Database() }
    }
}
