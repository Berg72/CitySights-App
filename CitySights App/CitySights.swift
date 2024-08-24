//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by Mark Bergeson on 3/28/24.
//

import SwiftUI

@main
struct CitySights: App {
    
    @State var model = BusinessModel()
    @AppStorage("onboarding") var needsOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(model)
                .fullScreenCover(isPresented: $needsOnboarding) {
//                    todo
                    needsOnboarding = false
                } content: {
                    OnboardingView()
                        .environment(model)
                }
                .onAppear {
                    if needsOnboarding == false && model.locationAuthStatus == .notDetermined {
                        model.getUserLocation()
                    }
                }

        }
    }
}
