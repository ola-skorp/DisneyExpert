//
//  File.swift
//  WebModule
//
//  Created by Ольга on 05.05.25.
//

import Foundation
import Swinject

public final class DiContainerWeb{
    nonisolated(unsafe) public static let shared = DiContainerWeb()
    public let container: Container
    
    private init() {
        container = Container()

        container.register(IDisneyWebRepository.self) { _ in DisneyWebRepository() }
    }
}
