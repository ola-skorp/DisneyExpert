//
//  File.swift
//  WebModule
//
//  Created by Ольга on 05.05.25.
//

import Foundation
import Swinject

final class DiContainerInternal {
    nonisolated(unsafe) static let shared = DiContainerInternal()
    let container: Container
    
    private init() {
        container = Container()

        container.register(CharacterWebMapper.self) { _ in CharacterWebMapper() }
    }
}
