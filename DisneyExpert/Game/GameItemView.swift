//
//  GameItemView.swift
//  DisneyExpert
//
//  Created by Ольга on 27.04.25.
//

import SwiftUI

struct GameItemView: View {
    let name: String
    let checked: Bool
    var body: some View {
        let color = if checked { Color.blue } else { Color.gray}
        
        Text(name)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(color)
            .foregroundColor(Color.white)
    }
}

#Preview {
    GameItemView(name: "Name", checked: false)
}
