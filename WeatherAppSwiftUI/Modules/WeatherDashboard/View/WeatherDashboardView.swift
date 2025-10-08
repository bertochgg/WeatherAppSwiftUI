//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 20/09/25.
//

import SwiftUI

struct WeatherDashboardView: View {
    @ObservedObject var weatherViewModel: WeatherByHourViewModel
    @Binding var isNewCitySearched: Bool
    var body: some View {
        ZStack {
            BackgroundDashboardView()
            VStack(spacing: 12) {
                HeaderDashboardView(currentCity: weatherViewModel.currentCity)
                TemperatureDashboardView(temperature: weatherViewModel.currentTemperature.toCelsius)
                WeatherConditionDashboardView(weatherDescription: weatherViewModel.weatherDescription,
                                              minTemperature: weatherViewModel.minTemperature.toCelsius,
                                              maxTemperature: weatherViewModel.maxTemperature.toCelsius)
                HouseDashboardView()
                Spacer()
            }
            .padding(.top, 70)
            
            WeatherSummaryDataView {
                WeatherDataSummaryDashboardView(weatherViewModel: weatherViewModel)
            }
            if weatherViewModel.isLoading { // Check -> Dashboard is visible before loader
                LoadingOverlayView()
            }
        }
        .task {
            guard weatherViewModel.capsules.isEmpty || isNewCitySearched else { return }
            if let city = UserDefaults.standard.string(forKey: "currentCity") {
            await weatherViewModel.fetchWeather(for: city)
            } else {
            await weatherViewModel.fetchWeather(for: "Tlaxcala")
            }
        }
        .animation(.bouncy, value: weatherViewModel.isLoading) // animate transition
    }
}

#Preview {
    WeatherDashboardView(weatherViewModel: WeatherByHourViewModel(), isNewCitySearched: .constant(true))
}
