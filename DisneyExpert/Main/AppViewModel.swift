//
//  AppViewModel.swift
//  DisneyExpert
//
//  Created by Ольга on 20.04.25.
//

import Foundation

class AppViewModel: ObservableObject{
    @Published var currentTab: TabType = .list
}
