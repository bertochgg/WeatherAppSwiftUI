//
//  WeatherAppSwiftUIApp.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 20/09/25.
//

import SwiftUI
import SwiftData

@main
struct WeatherAppSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            LiquidGlassTabAppView()
        }
        .modelContainer(for: [SavedCity.self])
    }
}
