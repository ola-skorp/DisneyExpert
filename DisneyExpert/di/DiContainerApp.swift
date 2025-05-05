//
//  DIContainerApp.swift
//  DisneyExpert
//
//  Created by Ольга on 05.05.25.
//

import Foundation
import Swinject
import WebModule

class DiContainerApp {
    nonisolated(unsafe) public static let shared = DiContainerApp()
    public let container: Container
    
    private init() {
        container = Container()
    }
}
