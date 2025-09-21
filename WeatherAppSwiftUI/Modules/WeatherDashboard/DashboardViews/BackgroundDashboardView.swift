//
//  BackgroundDashboardView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 21/09/25.
//

import SwiftUI

struct BackgroundDashboardView: View {
    var body: some View {
        Image("weatherSkyBackground")
            .resizable()
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundDashboardView()
}
