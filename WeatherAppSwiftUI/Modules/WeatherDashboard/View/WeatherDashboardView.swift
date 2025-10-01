//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 20/09/25.
//

import SwiftUI

struct WeatherDashboardView: View {
    @ObservedObject var weatherViewModel: WeatherByHourViewModel
    var body: some View {
        ZStack {
            BackgroundDashboardView()
            VStack(spacing: 12) {
                HeaderDashboardView()
                TemperatureDashboardView()
                WeatherConditionDashboardView()
                HouseDashboardView()
                Spacer()
            }
            .padding(.top, 70)
            
            WeatherSummaryDataView {
                WeatherDataSummaryDashboardView(weatherViewModel: weatherViewModel)
            }
            if weatherViewModel.isLoading { // Dashboard is visible before loader
                LoadingOverlayView()
            }
        }
        .task {
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
    WeatherDashboardView(weatherViewModel: WeatherByHourViewModel())
}
