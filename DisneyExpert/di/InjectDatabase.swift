//
//  InjectDatabase.swift
//  DisneyExpert
//
//  Created by Ольга on 05.05.25.
//

import Foundation
import Swinject
import DatabaseModule

@propertyWrapper
struct InjectedDatabase<T> {
    private var service: T

    init(name: String? = nil) {
        if let name = name {
            self.service = DiContainerDatabase.shared.container.resolve(T.self, name: name)!
        } else {
            self.service = DiContainerDatabase.shared.container.resolve(T.self)!
        }
    }

    var wrappedValue: T {
        service
    }
}
