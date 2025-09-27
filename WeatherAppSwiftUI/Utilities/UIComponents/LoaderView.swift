//
//  LoaderView.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 27/09/25.
//
import SwiftUI

struct LoadingOverlayView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.purple, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(2)
                Text("Fetching weather...")
                    .foregroundStyle(.white)
                    .font(.headline)
            }
            .padding(40)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(radius: 10)
        }
//        .transition(.opacity.combined(with: .scale)) // smooth transition
        
    }
}

#Preview {
    LoadingOverlayView()
}
