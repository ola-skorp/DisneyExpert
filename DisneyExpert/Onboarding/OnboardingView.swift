//
//  OnboardingView.swift
//  DisneyExpert
//
//  Created by Ольга on 29.04.25.
//

import SwiftUI

struct OnboardingView: View {
    let array = [
        OnboardingItem(title: "Welcome", text: "Would you like to be a disney expert?"),
        OnboardingItem(title: "How to play", text: "Mark your favorite characters to play", buttonText: "Start")
    ]
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0.0) {
                ForEach(Array(array.enumerated()), id: \.element.title) { index, item in
                    OnboardingItemView(item: item, currentIndex: index, total: array.count)
                        .containerRelativeFrame([.horizontal, .vertical], count: 1, spacing: 0)
                }
            }
        }
        .scrollTargetBehavior(.paging)
    }
}

#Preview {
    OnboardingView()
}
