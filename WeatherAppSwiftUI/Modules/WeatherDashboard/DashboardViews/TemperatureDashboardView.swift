//
//  TemperatureDashboardView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 21/09/25.
//

import SwiftUI

struct TemperatureDashboardView: View {
    let temperature: String
    var body: some View {
        Text(temperature)
            .foregroundStyle(.white)
            .font(.system(size: 96, weight: .thin))
    }
}

#Preview {
    TemperatureDashboardView(temperature: "19°")
        .background(Color.black)
}
