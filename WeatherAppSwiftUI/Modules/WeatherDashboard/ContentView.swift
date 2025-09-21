//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 20/09/25.
//

import SwiftUI

struct ContentView: View {
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
                WeatherDataSummaryDashboardView()
            }
        }
    }
}

#Preview {
    ContentView()
}
