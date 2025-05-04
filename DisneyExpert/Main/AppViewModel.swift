//
//  AppViewModel.swift
//  DisneyExpert
//
//  Created by Ольга on 20.04.25.
//

import Foundation

class AppViewModel: ObservableObject{
    @Published var currentTab: TabType = .list
    @Published var showOnboarding: Bool
    
    init() {
        let isOnboardingShown = UserDefaults.standard.bool(forKey: "isOnboardingShown")
        self.showOnboarding = !isOnboardingShown
    }
    
    func closeOnboarding(){
        showOnboarding = false
        UserDefaults.standard.set(true, forKey: "isOnboardingShown")
    }
}
