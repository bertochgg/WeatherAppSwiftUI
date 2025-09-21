//
//  HouseDashboardView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 21/09/25.
//

import SwiftUI

struct HouseDashboardView: View {
    var body: some View {
        Image("dashboardHouse")
            .resizable()
            .scaledToFit()
//            .frame(height: 200) // prevent blowing up
            .padding(.top, 16)
    }
}

#Preview {
    HouseDashboardView()
}
