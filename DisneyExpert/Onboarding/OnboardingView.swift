//
//  OnboardingView.swift
//  DisneyExpert
//
//  Created by Ольга on 29.04.25.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0.0) {
                ForEach(items) { item in
                    FullScreenItem(item)
                }
            }
        }
        .scrollTargetBehavior(.paging)
    }
}

#Preview {
    OnboardingView()
}
