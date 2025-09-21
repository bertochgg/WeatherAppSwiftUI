//
//  HeaderDashboardView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 21/09/25.
//

import SwiftUI

struct HeaderDashboardView: View {
    var body: some View {
        Text("Montreal")
            .font(.system(size: 34, weight: .regular))
            .foregroundStyle(.white)
    }
}

#Preview {
    HeaderDashboardView()
        .background(Color.blue)
}
