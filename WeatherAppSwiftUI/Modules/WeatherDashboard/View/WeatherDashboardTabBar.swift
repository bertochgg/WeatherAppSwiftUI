//
//  WeatherDashboardTabBar.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 28/09/25.
//
import SwiftUI

enum MyTab: Hashable {
    case home, settings, savedLocations, search
}

struct LiquidGlassTabAppView: View {
    @State private var selection: MyTab = .home
    @State private var searchString: String = ""

    var body: some View {
        TabView(selection: $selection) {
            Tab("Home", systemImage: "house.fill", value: .home) {
                WeatherDashboardView()
            }
            Tab("Locations", systemImage: "bookmark.fill", value: .savedLocations) {
                SearchView()
            }
            Tab("Settings", systemImage: "gearshape.fill", value: .settings) {
                SettingsView()
            }
            Tab(value: .search, role: .search) {
                NavigationStack {
                    List {
                        Text("Search city's weather")
                    }
                    .navigationTitle("Search")
                    .searchable(text: $searchString)
                }
            }
        }
    }
}

#Preview {
    LiquidGlassTabAppView()
}

struct SearchView: View {
    var body: some View {
        Text("hello search")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("hello settings")
    }
}

