//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 20/09/25.
//

import SwiftUI

struct WeatherDashboardView: View {
    @StateObject private var weatherViewModel = WeatherByHourViewModel()
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
            if weatherViewModel.isLoading {
                LoadingOverlayView()
            }
        }
        .task {
            await weatherViewModel.fetchWeather(for: "Tlaxcala")
        }
        .animation(.bouncy, value: weatherViewModel.isLoading) // animate transition
    }
}

#Preview {
    WeatherDashboardView()
}
