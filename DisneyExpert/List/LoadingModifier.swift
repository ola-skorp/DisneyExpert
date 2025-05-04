//
//  LoadingModifier.swift
//  DisneyExpert
//
//  Created by Ольга on 02.05.25.
//

import Foundation
import SwiftUI

struct LoadingModifier: ViewModifier {
    let withLoading: Bool

    func body(content: Content) -> some View {
        if withLoading {
            VStack(alignment: .leading) {
                content
                Divider()
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(maxWidth: .infinity)
            }.frame(maxWidth: .infinity)
        } else {
            content
        }
    }
}
