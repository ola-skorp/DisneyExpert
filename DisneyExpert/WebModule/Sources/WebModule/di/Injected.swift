//
//  File.swift
//  WebModule
//
//  Created by Ольга on 05.05.25.
//

import Foundation
import Swinject

@propertyWrapper
struct Injected<T> {
    private var service: T

    init(name: String? = nil) {
        if let name = name {
            self.service = DiContainerInternal.shared.container.resolve(T.self, name: name)!
        } else {
            self.service = DiContainerInternal.shared.container.resolve(T.self)!
        }
    }

    var wrappedValue: T {
        service
    }
}
