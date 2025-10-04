//
//  HeaderDashboardView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 21/09/25.
//

import SwiftUI

struct HeaderDashboardView: View {
    let currentCity: String
    var body: some View {
        Text(currentCity.capitalized)
            .font(.system(size: 34, weight: .regular))
            .foregroundStyle(.white)
    }
}

#Preview {
    HeaderDashboardView(currentCity: "some city")
        .background(Color.blue)
}
