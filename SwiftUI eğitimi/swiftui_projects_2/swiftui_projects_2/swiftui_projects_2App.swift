//
//  swiftui_projects_2App.swift
//  swiftui_projects_2
//
//  Created by obss on 27.01.2023.
//

import SwiftUI

@main
struct swiftui_projects_2App: App {
    @AppStorage("isonboarding") var isOnboardingViewActive: Bool = true
    var body: some Scene {
        WindowGroup {
            if isOnboardingViewActive{
                HomeView()
            } else {
                ContentView()
            }
            
        }
    }
}
