//
//  WeatherDataSummaryDashboardView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 21/09/25.
//

import SwiftUI

struct WeatherDataSummaryDashboardView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(0..<10) { _ in
                            WeatherByHourCapsuleView()
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            .padding(.top, 19)
            .padding(.bottom, 100)
        }
    }
}

#Preview {
    WeatherDataSummaryDashboardView()
}
