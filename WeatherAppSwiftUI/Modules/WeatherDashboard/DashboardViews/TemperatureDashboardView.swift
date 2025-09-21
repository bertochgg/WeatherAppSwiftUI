//
//  TemperatureDashboardView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 21/09/25.
//

import SwiftUI

struct TemperatureDashboardView: View {
    var body: some View {
        Text("19°")
            .foregroundStyle(.white)
            .font(.system(size: 96, weight: .thin))
    }
}

#Preview {
    TemperatureDashboardView()
        .background(Color.black)
}
