//
//  InjectedWeb.swift
//  DisneyExpert
//
//  Created by Ольга on 05.05.25.
//

import Foundation
import Swinject
import WebModule

@propertyWrapper
struct InjectedWeb<T> {
    private var service: T

    init(name: String? = nil) {
        if let name = name {
            self.service = DiContainerWeb.shared.container.resolve(T.self, name: name)!
        } else {
            self.service = DiContainerWeb.shared.container.resolve(T.self)!
        }
    }

    var wrappedValue: T {
        service
    }
}
