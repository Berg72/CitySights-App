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
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(model)
        }
    }
}
