//
//  SearchWeatherByCityView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 29/09/25.
//
import SwiftUI

struct SearchWeatherByCityView: View {
    @Binding var selection: MyTab
    @Binding var isNewCitySearched: Bool
    @ObservedObject var weatherByHourViewModel: WeatherByHourViewModel
    @State private var searchString = ""
    @State private var isSearchPresented = false

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [
                        Color(red: 69/255, green: 39/255, blue: 139/255).opacity(0.65),
                        Color(red: 46/255, green: 51/255, blue: 90/255).opacity(2)
                    ],
                    startPoint: .top, endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 20) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 64))
                        .foregroundStyle(.white.opacity(0.8))

                    Text("Type a city to get weather info")
                        .foregroundStyle(.white.opacity(0.9))
                        .font(.headline)
                }
            }
            .navigationTitle("Search City")
            .navigationBarTitleDisplayMode(.large)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .searchable(text: $searchString,
                        isPresented: $isSearchPresented,
                        prompt: "Enter city name")
            .onSubmit(of: .search) {
                guard !searchString.isEmpty else { return }
                storeCity(searchString)
                resetView()
                selection = .home
                isNewCitySearched = true
            }
            .onAppear {
                resetView()
            }
            .onDisappear {
                isNewCitySearched = false
            }
        }
        .foregroundStyle(.white)
    }

    private func storeCity(_ city: String) {
        UserDefaults.standard.set(city, forKey: "currentCity")
    }
    
    private func resetView() {
        isSearchPresented = false
        searchString = ""
    }
}

#Preview {
    SearchWeatherByCityView(selection: .constant(.home), isNewCitySearched: .constant(true), weatherByHourViewModel: WeatherByHourViewModel())
}
