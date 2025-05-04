//
//  OnboardingItemView.swift
//  DisneyExpert
//
//  Created by Ольга on 29.04.25.
//

import SwiftUI

struct OnboardingItemView: View {
    @EnvironmentObject var viewModel: AppViewModel
    let item: OnboardingItem
    let currentIndex: Int
    let total: Int
    var body: some View {
        VStack{
            Text(item.title)
            Text(item.text)
            Spacer()
            if item.buttonText != nil {
                Button(action: {
                    viewModel.closeOnboarding()
                }) {
                    Text("Let's go")
                }.padding(50)
            }
            HStack{
                ForEach(0..<total, id: \.self){ index in
                    Image(systemName:  index == currentIndex ? "circle.fill" : "circle")
                        .foregroundStyle(Color(uiColor: .systemGray3))
                }
            }
        }.padding(.vertical, 100).frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    OnboardingItemView(item: OnboardingItem(title: "", text: ""), currentIndex: 1, total: 2)
}
