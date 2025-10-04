//
//  WeatherConditionDashboardView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 21/09/25.
//

import SwiftUI

struct WeatherConditionDashboardView: View {
    let weatherDescription: String
    let minTemperature: String
    let maxTemperature: String
    var body: some View {
        VStack {
            Text(weatherDescription.capitalized)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(Color(red: 235/255, green: 235/255, blue: 245/255))
                .opacity(0.6)

            HStack {
                Text("Highest: \(maxTemperature)")
                Text("Lowest: \(minTemperature)")
            }
            .foregroundStyle(.white)
            .font(.system(size: 20, weight: .semibold))
        }
    }
}


#Preview {
    WeatherConditionDashboardView(weatherDescription: "mostly clear", minTemperature: "19°", maxTemperature: "22°")
}
