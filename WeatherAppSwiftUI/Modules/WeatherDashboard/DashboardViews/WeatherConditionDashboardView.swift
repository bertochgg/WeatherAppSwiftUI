//
//  WeatherConditionDashboardView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 21/09/25.
//

import SwiftUI

struct WeatherConditionDashboardView: View {
    var body: some View {
        VStack {
            Text("Mostly Clear")
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(Color(red: 235/255, green: 235/255, blue: 245/255))
                .opacity(0.6)

            HStack {
                Text("Highest: 24°")
                Text("Lowest: 18°")
            }
            .foregroundStyle(.white)
            .font(.system(size: 20, weight: .semibold))
        }
    }
}


#Preview {
    WeatherConditionDashboardView()
}
