//
//  WeatherDataSummaryDashboardView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 21/09/25.
//

import SwiftUI

struct WeatherDataSummaryDashboardView: View {
    @ObservedObject var weatherViewModel: WeatherByHourViewModel
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading,spacing: 8) {
                Text(DateFormatter.localizedString(from: Date(), dateStyle: .full, timeStyle: .none))
                    .foregroundStyle(Color.white)
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.leading, 16)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(weatherViewModel.capsules) { capsuleViewModel in
                            WeatherByHourCapsuleView(capsuleViewModel: capsuleViewModel)
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            .padding(.top, 0)
            .padding(.bottom, 100)
        }
    }
}

#Preview {
    ZStack {
        LinearGradient(colors: [Color.purple, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
        WeatherDataSummaryDashboardView(weatherViewModel: WeatherByHourViewModel())
    }
}
